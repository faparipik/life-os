/*
  Warnings:

  - Added the required column `name` to the `Associations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `title` to the `Notes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Status` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Associations" ADD COLUMN     "name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Notes" ADD COLUMN     "content" TEXT,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "title" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Status" ADD COLUMN     "name" TEXT NOT NULL;
