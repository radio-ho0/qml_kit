#ifndef TEMPQUICKCPP_H
#define TEMPQUICKCPP_H

#include <QObject>

class TempQuickcpp : public QObject
{
    Q_OBJECT
public:
    explicit TempQuickcpp(QObject *parent = 0);
    ~TempQuickcpp();

    static void registerQmlType();

signals:

public slots:

private :
    void init();

};

#endif // TEMPQUICKCPP_H
