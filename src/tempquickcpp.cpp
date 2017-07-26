#include "tempquickcpp.h"

#include <QtQml/QtQml>

TempQuickcpp::TempQuickcpp(QObject *parent) : QObject(parent)
{
    init();
}

TempQuickcpp::~TempQuickcpp()
{

}

void TempQuickcpp::registerQmlType()
{
    qmlRegisterType<TempQuickcpp>("com.ho0", 1, 0, "TempQuickcpp");
}

void TempQuickcpp::init()
{
    qDebug("init TempQuickcpp");
}
