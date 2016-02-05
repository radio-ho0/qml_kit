#ifndef EJSONPATH_H
#define EJSONPATH_H

#include <QObject>

class EJSONPath : public QObject
{
    Q_OBJECT
public:
    explicit EJSONPath(QObject *parent = 0);
    ~EJSONPath();

    Q_INVOKABLE void setJSON(QString str_json, QString str_query);

signals:
    void getVale(QString str);

public slots:
};

#endif // EJSONPATH_H
