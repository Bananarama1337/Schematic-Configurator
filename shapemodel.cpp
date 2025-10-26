#include "shapemodel.h"

QVariant ShapeModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= m_items.size())
        return {};

    const auto &item = m_items[index.row()];
    switch (role) {
        case TypeRole: return item.type;
        case PositionRole: return item.position;
        default: return {};
    }
}

void ShapeModel::addShape(const QString &type, const QPointF &pos) {
    beginInsertRows(QModelIndex(), m_items.size(), m_items.size());
    m_items.append({ type, pos });
    endInsertRows();
}

void ShapeModel::clear() {
    beginResetModel();
    m_items.clear();
    endResetModel();
}
