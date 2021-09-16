#ifndef LUSMQTT_H
#define LUSMQTT_H

#include <QObject>
#include <QtMqtt>
#include <QMqttClient>

class LusMqtt : public QObject
{
    Q_OBJECT
public:
    LusMqtt();
    Q_INVOKABLE int connect_mqtt(void);
    Q_INVOKABLE void mqttpublish(QString str);
private slots:
    void updateLogStateChange(void);
    void mqttconnected_solt();
    void brokerDisconnected();
signals:
    void mqtt_cnted();
    void mqtt_discnt();
private:
    QMqttClient *m_client;
};

#endif // LUSMQTT_H
