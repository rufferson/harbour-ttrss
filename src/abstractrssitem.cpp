#include "abstractrssitem.h"

AbstractRssItem::AbstractRssItem(QObject *parent) :
    QObject(parent)
{
}
int AbstractRssItem::id() const { return m_id; }

QString AbstractRssItem::title() const { return m_title; }

