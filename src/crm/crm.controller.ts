import { Body, Controller, Post } from '@nestjs/common';
import { CrmService } from './crm.service';
import { PersonDto } from './dto';

@Controller('crm')
export class CrmController {
  constructor(private crmService: CrmService) {}

  @Post()
  addNewPerson(@Body() body: PersonDto) {
    return this.crmService.addNewPerson(body);
  }
}
