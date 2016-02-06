#include "ejsonpath.h"
#include "qtjsonpath/QtJsonPath.h"

EJSONPath::EJSONPath(QObject *parent) : QObject(parent)
{

}

EJSONPath::~EJSONPath()
{

}

void EJSONPath::setJSON(QString str_json, QString str_query)
{
    QByteArray arr(str_json.toUtf8());
    QJsonDocument jsonDoc = QJsonDocument::fromJson(arr);
    QtJsonPath    jpath(jsonDoc);

    QVariant val1 = jpath.getValue(str_query);
    QString str   = val1.toString();

    emit getVale(str);
}

