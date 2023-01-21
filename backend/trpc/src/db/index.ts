import { Sequelize, Model, ModelCtor } from 'sequelize';
import config from '../config'
import { NoteModel } from '../models/note.model';

const sequelize = new Sequelize(config.DATABASE, config.USERNAME, config.PASSWORD, {
  host: config.HOST,
  dialect: 'postgres'
});


let db: {
  Sequelize: typeof Sequelize,
  sequelize: Sequelize,
  connect: () => Promise<void>,
} = {} as any

db.Sequelize = Sequelize;
db.sequelize = sequelize;

// List Model
type DbModel = ModelCtor<Model<any, any>>

export const Note: DbModel = NoteModel(db.sequelize)

db.connect = async () => {
  try {
    await db.sequelize.authenticate();
    console.log('Connection database has been established successfully.');

    await db.sequelize.sync()
    console.log("Synced db.");
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
}


export default db
