/*
  Warnings:

  - You are about to drop the `Messages` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Messages";

-- CreateTable
CREATE TABLE "Message" (
    "id" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "text" STRING NOT NULL,
    "parentId" STRING,
    "likes" INT4 NOT NULL,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("id")
);
