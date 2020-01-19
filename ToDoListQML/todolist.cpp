#include <QFile>
#include <QTextStream>

#include "todolist.h"

ToDoList::ToDoList(QObject *parent) : QObject(parent)
{
    m_items.append({false, QStringLiteral("Test1")});
    m_items.append({true, QStringLiteral("Test2")});
}

QVector<ToDoItem> ToDoList::items() const
{
    return m_items;
}

bool ToDoList::setItemAt(int index, const ToDoItem &item)
{
    if(index < 0 || index >= m_items.size())
        return false;

    m_items[index] = item;
    return true;
}

bool ToDoList::saveList()
{
    QString filename = "Save.txt";
    QFile file(filename);
    if(file.open(QIODevice::ReadWrite))
    {
        QTextStream stream(&file);
        stream<<m_items.size()<<'\n';
        for(int i = 0; i<m_items.size(); ++i)
        {
            m_items.at(i).itemComplete ? stream << "1 "<<m_items.at(i).itemDescription.toUtf8()<<'\n'
                                                   : stream << "0 "<<m_items.at(i).itemDescription.toUtf8()<<'\n';
        }
    }
    file.close();
    return true;
}

bool ToDoList::loadList()
{
    m_items.clear();

    QString filename = "Save.txt";
    QFile file(filename);
    if(file.open(QIODevice::ReadOnly))
    {
        QTextStream stream(&file);
        int size;
        stream>>size;
        for(int i = 0; i < size; ++i)
        {
            QString complete;
            stream>>complete;
            QString description = stream.readLine();
            m_items.append({complete == "1", description.mid(1)});
        }
    }
    return true;
}

void ToDoList::addItem(QString itemDescription)
{
    emit preAddItem();

    ToDoItem item;
    item.itemComplete = false;
    item.itemDescription = itemDescription;
    m_items.push_back(item);

    emit postAddItem();
}

void ToDoList::removeCompletedItems()
{
    for(int index = 0; index<m_items.size(); ++index)
    {
        if(m_items[index].itemComplete == true)
        {
            emit preRemoveItem(index);

            m_items.removeAt(index);
            --index;

            emit postRemoveItem();
        }
    }
}
