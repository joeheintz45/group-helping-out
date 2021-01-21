import express from 'express';
import bodyParser from 'body-parser';
import sessionMiddleware from './modules/session-middleware';
import passport from './strategies/user.strategy';
import userRouter from './routes/user.router';
import postingRouter from './routes/posting.router';
import activitiesRouter from './routes/activity.router';
import causesRouter from './routes/causes.router';
import adminRouter from './routes/admin.router';
import agesRouter from './routes/ages.router';
import organizationRouter from './routes/organization.router';
import eventNotifications from './cronjob/event.notification';
import imageUrlRouter from './routes/imageUrl.router';
import volunteerRouter from './routes/volunteer.router';

require('dotenv').config();

const app: any = express();

const UploadS3Router = require('react-dropzone-s3-uploader/s3router');

// Body parser middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Passport Session Configuration //
app.use(sessionMiddleware);

// start up passport sessions
app.use(passport.initialize());
app.use(passport.session());

/* Routes */
app.use('/api/user', userRouter);
app.use('/api/postings', postingRouter);
app.use('/api/activities', activitiesRouter);
app.use('/api/causes', causesRouter);
app.use('/api/admin', adminRouter);
app.use('/api/ages', agesRouter);
app.use('/api/organization', organizationRouter);
app.use('/api/imageurl', imageUrlRouter);
app.use(
  '/s3',
  UploadS3Router({
    bucket: 'kairos-images-bucket',
    region: 'us-east-2',
    headers: { 'Access-Control-Allow-Origin': '*' },
    ACL: 'public-read',
  })
);
app.use('/api/volunteer', volunteerRouter);

// Serve static files
app.use(express.static('build'));

// App Set //
const PORT: number | string = process.env.PORT || 5000;

/** Listen * */
app.listen(PORT, (): void => {
  console.log(`So awesome. Much wow. Listening on port: ${PORT}`);
  eventNotifications();
});

export default app;
