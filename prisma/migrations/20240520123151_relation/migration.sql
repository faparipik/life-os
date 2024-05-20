/*
  Warnings:

  - You are about to drop the column `userId` on the `Status` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[statusId]` on the table `People` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Status" DROP CONSTRAINT "Status_userId_fkey";

-- DropIndex
DROP INDEX "Status_userId_key";

-- AlterTable
ALTER TABLE "Status" DROP COLUMN "userId";

-- CreateIndex
CREATE UNIQUE INDEX "People_statusId_key" ON "People"("statusId");

-- AddForeignKey
ALTER TABLE "People" ADD CONSTRAINT "People_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES "Status"("id") ON DELETE SET NULL ON UPDATE CASCADE;
