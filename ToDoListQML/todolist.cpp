#include "todolist.h"

ToDoList::ToDoList(QObject *parent) : QObject(parent)
{
    m_items.append({"Test1"});
    m_items.append({"Test2"});
}

QVector<ToDoItem> ToDoList::items() const
{
    return m_items;
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
