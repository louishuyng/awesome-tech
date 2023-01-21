import { DataTypes, Sequelize } from 'sequelize';

export const NoteModel = (sequelize: Sequelize) => {
  return sequelize.define("note", {
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    state: {
      type: DataTypes.ENUM,
      values: ['todo', 'completed'],
      defaultValue: 'todo',
      allowNull: false
    },
    priority: {
      type: DataTypes.ENUM,
      values: ['high', 'medium', 'low', 'none'],
      defaultValue: 'none',
      allowNull: false
    }
  });
};
