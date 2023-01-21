import { Sequelize } from 'sequelize';
import config from '../config'
import { initModel } from '../models';

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

db.connect = async () => {
  try {
    await db.sequelize.authenticate();
    console.log('Connection database has been established successfully.');

    initModel(db.sequelize)
    await db.sequelize.sync({ force: true })
    console.log("Drop and re-sync db.");
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
}


export default db
