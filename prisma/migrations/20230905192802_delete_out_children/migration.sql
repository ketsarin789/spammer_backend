/*
  Warnings:

  - You are about to drop the column `count` on the `Messages` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Messages` table. All the data in the column will be lost.
  - Added the required column `likes` to the `Messages` table without a default value. This is not possible if the table is not empty.
  - Added the required column `text` to the `Messages` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Messages" DROP COLUMN "count";
ALTER TABLE "Messages" DROP COLUMN "name";
ALTER TABLE "Messages" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE "Messages" ADD COLUMN     "likes" INT4 NOT NULL;
ALTER TABLE "Messages" ADD COLUMN     "parentId" STRING;
ALTER TABLE "Messages" ADD COLUMN     "text" STRING NOT NULL;
