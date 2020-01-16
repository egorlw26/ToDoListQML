#ifndef TODOLIST_H
#define TODOLIST_H

#include <QObject>
#include <QVector>

struct ToDoItem
{
    QString itemDescription;
};

class ToDoList : public QObject
{
    Q_OBJECT
public:

    explicit ToDoList(QObject *parent = nullptr);

    QVector<ToDoItem> items() const;

    bool setItemAt(int index, const ToDoItem &item);

signals:
    void preAddItem();
    void postAddItem();

    void preRemoveItem(int index);
    void postRemoveItem();

public slots:
    void addItem();
    void removeItem(int index);

private:
    QVector<ToDoItem> m_items;
};

#endif // TODOLIST_H
