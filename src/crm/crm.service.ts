import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { PersonDto } from './dto';

@Injectable()
export class CrmService {
  constructor(private prisma: PrismaService) {}

  addNewPerson(body: PersonDto) {
    const formatedPersonBody = this.formatPersonBody(body);
    return this.prisma.people.create({
      data: {
        ...formatedPersonBody,
      },
    });
  }

  formatPersonBody({
    name,
    lastContactDate,
    statusId,
    associations,
    notes,
  }: PersonDto) {
    return {
      name,
      lastContactDate,
      statusId,
      associations: { create: associations },
      notes: { create: notes },
    };
  }
}
