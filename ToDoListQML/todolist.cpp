#include "todolist.h"

ToDoList::ToDoList(QObject *parent) : QObject(parent)
{
    m_items.append({QStringLiteral("Test1")});
    m_items.append({QStringLiteral("Test2")});
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

void ToDoList::addItem()
{
    emit preAddItem();

    ToDoItem item;
    item.itemDescription = "NewItem";
    items().push_back(item);

    emit postAddItem();
}

void ToDoList::removeItem(int index)
{
    emit preRemoveItem(index);

    m_items.removeAt(index);

    emit postRemoveItem();
}
