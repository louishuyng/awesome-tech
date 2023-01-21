import { Sequelize } from 'sequelize';
import { NoteModel } from './note.model';

export const initModel = (sequelize: Sequelize) => {
  NoteModel(sequelize)
}
