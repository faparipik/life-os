import {
  IsDate,
  IsNotEmpty,
  IsString,
  IsArray,
  IsNumber,
  IsOptional,
} from 'class-validator';

export class PersonDto {
  @IsString()
  name?: string;

  @IsDate()
  @IsOptional()
  lastContactDate?: string;

  @IsArray()
  @IsOptional()
  associations?: Associations[];

  @IsArray()
  @IsOptional()
  notes?: Notes[];

  @IsNumber()
  @IsOptional()
  statusId?: number;
}

export class Associations {
  @IsString()
  @IsNotEmpty()
  name: string;
}

export class Notes {
  @IsString()
  @IsNotEmpty()
  title: string;

  @IsString()
  description?: string;

  @IsString()
  content?: string;
}
