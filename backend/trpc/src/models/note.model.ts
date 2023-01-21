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
    }
  });
};
