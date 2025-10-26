#ifndef SHAPE_MODEL_H
#define SHAPE_MODEL_H
#include <QAbstractListModel>
#include "shapeitem.h"

class ShapeModel : public QAbstractListModel {
    Q_OBJECT
public:
    enum Roles {
        TypeRole = Qt::UserRole + 1,
        PositionRole
    };

    explicit ShapeModel(QObject *parent = nullptr) : QAbstractListModel(parent) {}

    int rowCount(const QModelIndex &parent = QModelIndex()) const override {
        Q_UNUSED(parent);
        return m_items.size();
    }

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override {
        return {
            { TypeRole, "type" },
            { PositionRole, "position" }
        };
    }

public slots:
    void addShape(const QString &type, const QPointF &pos);
    void clear();

private:
    QList<ShapeItem> m_items;
};

#endif  //  SHAPE_MODEL_H
