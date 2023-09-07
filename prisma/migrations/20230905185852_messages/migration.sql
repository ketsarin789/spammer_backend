-- CreateTable
CREATE TABLE "Messages" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "count" INT4 NOT NULL DEFAULT 0,

    CONSTRAINT "Messages_pkey" PRIMARY KEY ("id")
);
