-- CreateTable
CREATE TABLE "Children" (
    "id" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "text" STRING NOT NULL,
    "parentId" STRING,
    "messageId" STRING,

    CONSTRAINT "Children_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Children" ADD CONSTRAINT "Children_messageId_fkey" FOREIGN KEY ("messageId") REFERENCES "Message"("id") ON DELETE SET NULL ON UPDATE CASCADE;
