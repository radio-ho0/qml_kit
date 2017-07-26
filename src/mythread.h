#ifndef MYTHREAD_H
#define MYTHREAD_H

#include <QThread>

class MyThread : public QThread
{
    Q_OBJECT
public:
    explicit MyThread(QObject *parent = 0);
    ~MyThread();

    void setRun(bool run);

signals:

protected :
    virtual void run();

private:
    void init();

    bool m_run;
};

#endif // MYTHREAD_H
