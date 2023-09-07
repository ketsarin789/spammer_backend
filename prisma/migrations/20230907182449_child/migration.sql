/*
  Warnings:

  - You are about to drop the `Children` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Children" DROP CONSTRAINT "Children_messageId_fkey";

-- DropTable
DROP TABLE "Children";

-- CreateTable
CREATE TABLE "Child" (
    "id" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "text" STRING NOT NULL,
    "parentId" STRING,
    "likes" INT4 NOT NULL,

    CONSTRAINT "Child_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Child" ADD CONSTRAINT "Child_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Message"("id") ON DELETE SET NULL ON UPDATE CASCADE;
