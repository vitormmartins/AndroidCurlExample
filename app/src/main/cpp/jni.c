#include <jni.h>
#include "./curl-a-website/curl_a_website.h"

char *CA_BUNDLE_PATH;

JNIEXPORT jboolean
Java_io_robertying_androidcurlexample_CurlHelper_curlAWebsite(JNIEnv *env,
                                                              jclass thiz,
                                                              jstring ca_bundle_path,
                                                              jstring url) {
    CA_BUNDLE_PATH = (char *) (*env)->GetStringUTFChars(env, ca_bundle_path, NULL);
    const char *c_url = (*env)->GetStringUTFChars(env, url, NULL);

    uint8_t success = curl_a_website(c_url);
    return success;
}

JNIEXPORT jstring
Java_io_robertying_androidcurlexample_CurlHelper_getCurlVersion(JNIEnv *env,
                                                                jclass thiz) {
    const char* versionChar = get_curl_version();
    return (*env)->NewStringUTF(env, versionChar);
}
