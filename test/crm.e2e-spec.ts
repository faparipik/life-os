import { Test } from '@nestjs/testing';
import { AppModule } from '../src/app.module';
import { INestApplication, ValidationPipe } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

import * as pactum from 'pactum';
import { PersonDto } from '../src/crm/dto';

describe('App e2e', () => {
  let app: INestApplication;
  let prisma: PrismaService;

  beforeAll(async () => {
    const moduleRef = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleRef.createNestApplication();

    app.useGlobalPipes(
      new ValidationPipe({
        whitelist: true,
      }),
    );

    await app.init();

    await app.listen('3334');

    prisma = app.get(PrismaService);

    await prisma.cleanDb();
    pactum.request.setBaseUrl('http://localhost:3334');
  });

  describe('crm', () => {
    const dto: PersonDto = {
      name: 'Faruk NEBOVIC',
      associations: [{ name: 'test' }],
      notes: [{ title: 'title' }],
    };
    describe('person', () => {
      it('should create person', () => {
        return pactum.spec().post('/crm').withBody(dto).expectStatus(201);
      });
      it('should get person', () => {
        return pactum.spec().get('/crm').expectStatus(200);
      });
    });
  });

  afterAll(() => {
    app.close();
  });
});
