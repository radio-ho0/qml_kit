#include "mythread.h"

MyThread::MyThread(QObject *parent) : QThread(parent)
{
    moveToThread(this);
    init();
}

MyThread::~MyThread()
{
    setRun(false);
}

void MyThread::run()
{
    while(m_run){
        qDebug("run in MyThread");
        QThread::sleep(1);
    }
}

void MyThread::init()
{

}

void MyThread::setRun(bool run)
{
    m_run = run;
}
