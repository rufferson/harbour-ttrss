#ifndef ABSTRACTRSSITEM_H
#define ABSTRACTRSSITEM_H

#include <QObject>

class AbstractRssItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString title READ title CONSTANT)
    Q_PROPERTY(int id READ id CONSTANT)
public:
    explicit AbstractRssItem(QObject *parent = 0);
    QString title() const;
    int id() const;
protected:
    int m_id;
    QString m_title;
signals:

public slots:

};

#endif // ABSTRACTRSSITEM_H
