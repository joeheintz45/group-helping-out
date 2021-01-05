import { Request, Response } from 'express';
import express from 'express';
import rejectUnauthenticated from '../modules/authentication-middleware';
import pool from '../modules/pool';
import userStrategy from '../strategies/user.strategy';
import { encryptPassword } from '../modules/encryption';

const router: express.Router = express.Router();

router.get('/', rejectUnauthenticated, (req: Request, res: Response): void => {
  res.send(req.user);
});

router.post(
  '/register/vol',
  (req: Request, res: Response, next: express.NextFunction): void => {
    const username: string | null = <string>req.body.username;
    const password: string | null = encryptPassword(req.body.password);
    const first_name: string | null = <string>req.body.first_name;
    const last_name: string | null = <string>req.body.last_name;
    const email_address: string | null = <string>req.body.email_address;
    const phone_number: string | null = <string>req.body.phone_number;
    const company: boolean | null = <boolean>req.body.company;
    const company_name: string | null = <string>req.body.company_name;
    const non_profit: boolean | null = <boolean>req.body.non_profit;
    const active: boolean | null = <boolean>req.body.active;
    const access_level: number | null = <number>req.body.access_level;

    const queryText: string = `INSERT INTO "user" (username, password, first_name, last_name, email_address, phone_number, 
    company, company_name, non_profit, active, access_level) 
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) 
    RETURNING id`;
    pool
      .query(queryText, [
        username,
        password,
        first_name,
        last_name,
        email_address,
        phone_number,
        company,
        company_name,
        non_profit,
        active,
        access_level,
      ])
      .then(() => res.sendStatus(201))
      .catch((err) => {
        console.log(`Error saving user to database: ${err}`);
        res.sendStatus(500);
      });
  }
);

// router.post(
//   '/register/org',
//   (req: Request, res: Response, next: express.NextFunction): void => {
//     try{
//     const username: string | null = <string>req.body.username;
//     const password: string | null = encryptPassword(req.body.password);
//     const first_name: string | null = <string>req.body.first_name;
//     const last_name: string | null = <string>req.body.last_name;
//     const email_address: string | null = <string>req.body.email_address;
//     const phone_number: string | null = <string>req.body.phone_number;
//     const company: boolean | null = <boolean>req.body.company;
//     const company_name: string | null = <string>req.body.company_name;
//     const non_profit: boolean | null = <boolean>req.body.non_profit;
//     const active: boolean | null = <boolean>req.body.active;
//     const access_level_id: number | null = <number>req.body.access_level_id;

//     const queryText: string = `INSERT INTO "user" (username, password, first_name, last_name, email_address, phone_number,
//       company, company_name, non_profit, active, access_level_id)
//       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
//       RETURNING id`;
//     pool
//       .query(queryText, [
//         username,
//         password,
//         first_name,
//         last_name,
//         email_address,
//         phone_number,
//         company,
//         company_name,
//         non_profit,
//         active,
//         access_level_id,
//       ])
//       .then((result) => {
//         const newUserId = result.rows[0].id;

//       });
//     }catch(err) {
//         console.log(`Error saving user to database: ${err}`);
//         res.sendStatus(500);
//       };
//   }
// );

router.post(
  '/login',
  userStrategy.authenticate('local'),
  (req: Request, res: Response): void => {
    res.sendStatus(200);
  }
);

router.post('/logout', (req: Request, res: Response): void => {
  req.logout();
  res.sendStatus(200);
});

export default router;
