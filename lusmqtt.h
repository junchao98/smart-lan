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

    void brokerDisconnected();
signals:

private:
    QMqttClient *m_client;
};

#endif // LUSMQTT_H
