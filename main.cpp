#include <QCoreApplication>
#include <QAndroidService>
#include "packagemanager.h"

int main(int argc, char *argv[])
{
    QAndroidService a(argc, argv);

    QAndroidService::setOrganizationName("samsung");
    QAndroidService::setOrganizationDomain("samsung.com");
    QAndroidService::setApplicationName("SDSLoader");

//    PackageManager *pack = new PackageManager();
//    pack->addApplication("SDS Viewer","org.samsung.pcviewer");
//    pack->launchApplication("org.samsung.pcviewer");

    QAndroidJniObject activity =
            QAndroidJniObject::callStaticObjectMethod( "org/qtproject/qt5/android/QtNative",
                                                       "activity",
                                                       "()Landroid/app/Activity;");   //activity is valid

    if ( activity.isValid() )
    {
        // Equivalent to Jave code: 'Intent intent = new Intent();'
        QAndroidJniObject intent("android/content/Intent","()V");
        if ( intent.isValid() )
        {
            QAndroidJniObject param1 = QAndroidJniObject::fromString("com.android.settings");
            QAndroidJniObject param2 = QAndroidJniObject::fromString("com.android.settings.DevelopmentSettings");

            if ( param1.isValid() && param2.isValid() )
            {
                // Equivalent to Jave code: 'intent.setClassName("com.android.settings", "com.android.settings.DevelopmentSettings");'
                intent.
                callObjectMethod( "setClassName",
                                  "(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;",
                                   param1.object<jobject>(),param2.object<jobject>());

                // Equivalent to Jave code: 'startActivity(intent);'
                activity.
                callObjectMethod( "startActivity",
                                  "(Landroid/content/Intent;)V",intent.object<jobject>());
            }
        }
    }

    return a.exec();
}
