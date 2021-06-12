#include "lusmqtt.h"

LusMqtt::LusMqtt()
{

    qDebug()<<"init mqtt";
    m_client = new QMqttClient(this);
    m_client->setHostname("junchao.work");
    m_client->setPort(1883);
    m_client->setUsername("test");
    m_client->setPassword("123456");

    connect(m_client, SIGNAL(stateChanged(ClientState)), this, SLOT(updateLogStateChange(void)));
    connect(m_client, SIGNAL(disconnected()), this, SLOT(brokerDisconnected()));

    connect(m_client, &QMqttClient::messageReceived, this, [this](const QByteArray &message, const QMqttTopicName &topic) {
        const QString content = QDateTime::currentDateTime().toString()
                    + QLatin1String(" Received Topic: ")
                    + topic.name()
                    + QLatin1String(" Message: ")
                    + message
                    + QLatin1Char('\n');
        qDebug()<<content;
    });

    connect(m_client, &QMqttClient::pingResponseReceived, this, [this]() {
        const QString content = QDateTime::currentDateTime().toString()
                    + QLatin1String(" PingResponse")
                    + QLatin1Char('\n');
        qDebug()<<content;
    });

    m_client->connectToHost();

}

int LusMqtt::connect_mqtt(void)
{
    qDebug()<<"cnt";
    return 0;
}
void LusMqtt::mqttpublish(QString str)
{
    QStringList list_str = str.split("*");

    QString topic = list_str.at(0);
    QByteArray msg = list_str.at(1).toLatin1();
    m_client->publish(topic, msg, 0);

    qDebug()<<topic;
    qDebug()<<msg;
}

void LusMqtt::updateLogStateChange(void)
{

    if(m_client->state() == QMqttClient::Connected){
        QString topic = "home/#";
        m_client->subscribe(topic, 0);
        qDebug()<<"connected";
        m_client->publish(topic, "hello i'm ctl", 0);
    }else if(m_client->state() == QMqttClient::Disconnected){
        qDebug()<<"reconnet!";
        m_client->connectToHost();
    }
}

void LusMqtt::brokerDisconnected()
{
    qDebug()<<"broker disconnected";
}
