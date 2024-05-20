-- CreateTable
CREATE TABLE "People" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT,
    "lastContactDate" TIMESTAMP(3),
    "birthday" TIMESTAMP(3),
    "photoUrl" TEXT,
    "statusId" INTEGER,

    CONSTRAINT "People_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Associations" (
    "id" SERIAL NOT NULL,
    "peopleId" INTEGER,

    CONSTRAINT "Associations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notes" (
    "id" SERIAL NOT NULL,
    "peopleId" INTEGER,

    CONSTRAINT "Notes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Status" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Status_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Status_userId_key" ON "Status"("userId");

-- AddForeignKey
ALTER TABLE "Associations" ADD CONSTRAINT "Associations_peopleId_fkey" FOREIGN KEY ("peopleId") REFERENCES "People"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notes" ADD CONSTRAINT "Notes_peopleId_fkey" FOREIGN KEY ("peopleId") REFERENCES "People"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Status" ADD CONSTRAINT "Status_userId_fkey" FOREIGN KEY ("userId") REFERENCES "People"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
