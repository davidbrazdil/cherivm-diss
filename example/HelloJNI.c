#include <jni.h>

JNIEXPORT jstring JNICALL
Java_HelloJNI_getMessage(JNIEnv *env, jclass clazz) {
    jstring str = (*env)->NewStringUTF(env, "Hello, JNI!!!");
    return str;
}

