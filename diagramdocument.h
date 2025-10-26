#ifndef DIAGRAM_DOCUMENT_H
#define DIAGRAM_DOCUMENT_H

#include <QObject>
#include <QList>
#include <QSharedPointer>
#include "shapemodel.h"

class DiagramDocument : public QObject {
    Q_OBJECT
    Q_PROPERTY(ShapeModel* model READ model CONSTANT)

public:
    explicit DiagramDocument(QObject *parent = nullptr)
        : QObject(parent),
        m_model(QSharedPointer<ShapeModel>::create())
    {}

    ShapeModel* model() const { return m_model.data(); }

    Q_INVOKABLE void addShape(const QString &type, const QPointF &pos) {
        m_model->addShape(type, pos);
    }

    Q_INVOKABLE void clear() {
        m_model->clear();
    }

private:
    QSharedPointer<ShapeModel> m_model;
};

#endif  //  DIAGRAM_DOCUMENT_H
