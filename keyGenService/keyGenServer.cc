#include <cmath>
#include <cstring>
#include <cstdio>
#include <openssl/bio.h>
#include <openssl/evp.h>
#include <openssl/md5.h>
//Encodes Base64
#include <iostream>
#include <string>
#include <unordered_map>

using namespace std;

unsigned char *getMD5Hash(unsigned char *data, size_t dataLen, int *mdLen) {
    unsigned char *md = NULL;
    EVP_MD_CTX *ctx = NULL;
    const EVP_MD *mdType = EVP_md5();
    *mdLen = EVP_MD_size(mdType);
    md = (unsigned char *) malloc(*mdLen);
    ctx = EVP_MD_CTX_create();
    EVP_MD_CTX_init(ctx);
    EVP_DigestInit_ex(ctx, mdType, NULL);
    EVP_DigestUpdate(ctx, data, dataLen);
    EVP_DigestFinal_ex(ctx, md, NULL);
    EVP_MD_CTX_free(ctx);
    return md;
}

int base64Encode(const char* message, char** buffer) {
    BIO *bio, *b64;
    FILE* stream;
    int encodedSize = 4*ceil((double)strlen(message)/3);
    *buffer = (char *)malloc(encodedSize+1);
    stream = fmemopen(*buffer, encodedSize+1, "w");
    b64 = BIO_new(BIO_f_base64());
    bio = BIO_new_fp(stream, BIO_NOCLOSE);
    bio = BIO_push(b64, bio);
    BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL);//Ignore newlines - write 
    //everything in one line
    BIO_write(bio, message, strlen(message));
    BIO_flush(bio);
    BIO_free_all(bio);
    fclose(stream);
    return (0); //success
}

int base64Decode(char* b64message, char** buffer) { //Decodes a base64 encoded string
    auto  calcDecodeLength = [](const char* b64input) {
        int len = strlen(b64input);
        int padding = 0;
        if (b64input[len-1] == '=' && b64input[len-2] == '=') //last two chars are =
            padding = 2;
        else if (b64input[len-1] == '=') //last char is =
            padding = 1;
        return (int)len*0.75 - padding;
    };

    BIO *bio, *b64;
    int decodeLen = calcDecodeLength(b64message),
        len = 0;
    *buffer = (char*)malloc(decodeLen+1);
    FILE* stream = fmemopen(b64message, strlen(b64message), "r");

    b64 = BIO_new(BIO_f_base64());
    bio = BIO_new_fp(stream, BIO_NOCLOSE);
    bio = BIO_push(b64, bio);
    BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use newlines to flush buffer
    len = BIO_read(bio, *buffer, strlen(b64message));
    //Can test here if len == decodeLen - if not, then return an error
    (*buffer)[len] = '\0';

    BIO_free_all(bio);
    fclose(stream);

    return (0); //success
}

class URLShortner
{
    std::unordered_map<string,string> urlHash;
    std::unordered_map<string,string> b64ToHash;
    public:
    string shorten(const string& url) {
        int mdLen = 0;
        char * urlp = new char[url.size()+1];
        std::copy(url.begin(), url.end(), urlp);
        urlp [url.size()] = '\0';
        unsigned char* md = getMD5Hash(reinterpret_cast<unsigned char*>(urlp)
                ,url.size(), &mdLen);
        delete urlp;
        string mdStr;
        for(int i=0; i < 16; i++) {
            mdStr.push_back(md[i]);
        }
#ifdef DEBUG
        cout << url << " MD5HASHED TO " << mdStr << endl;
#endif
        free(md);
        urlHash[mdStr]= url;
        //B64 Encoding of the Hash
        char * encoded;
        base64Encode(reinterpret_cast<const char*>(md), &encoded);
        int len = 4;
        string encodedStr(encoded);
#ifdef DEBUG
        cout << "B64 ENCODED TO " <<  encodedStr << endl;
#endif
        string shortened = encodedStr.substr(0, len);
        while(b64ToHash.find(shortened) != b64ToHash.end()) {
            len++;
            shortened= mdStr.substr(0, len);
        }
#ifdef DEBUG
        cout << "SHORTED TO " << shortened << endl;
#endif
        b64ToHash[shortened]= mdStr;
        free(encoded);
        return shortened;
    }

    string getUrl(const string& shortened) {
        return urlHash[b64ToHash[shortened]];
    }
};

int main(int argc, char** argv) {
    URLShortner shortener;
    string cmd;
    string input;
    cin >> cmd;
    while(not cmd.empty()) {
        cin >> input;
        if(cmd == "GET") {
            cout << shortener.getUrl(input) << endl; 
        }

        if(cmd == "SHORTEN") {
            cout << shortener.shorten(input) << endl; 
        }
        cin >> cmd;
    }
}
