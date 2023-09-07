import express from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const app = express();

app.use(express.json());

app.get("/", (req, res) => {
  res.send({ success: true, message: "Welcome to spammer Server" });
});

app.get("/messages", async (req, res) => {
  const messages = await prisma.message.findMany({
    include: { child: true },
  });
  res.send({ success: true, messages });
});

//post

app.post("/messages", async (req, res) => {
  const { text, parentId } = req.body;

  //checks if text is provided in request body, if not it returns an error response
  if (!text) {
    return res.send({
      success: false,
      error: "Text must be provided to create a message!",
    });
  }
  try {
    let message;
    if (parentId) {
      //check if parent message exists
      const parentMessage = await prisma.message.findUnique({
        where: {
          id: parentId,
        },
      });

      //Adds children to a parent message,
      message = await prisma.child.create({
        data: {
          text,
          parentId,
        },
      });
    } else {
      message = await prisma.message.create({
        data: {
          text,
        },
      });
    }

    res.send({ success: true, message });
  } catch (error) {
    console.error(error); // Log the error for debugging
    return res.send({ success: false, error: error.message });
  }
});

app.put("/messages/:messageId", async (req, res) => {
  const { messageId } = req.params;
  const { text, likes } = req.body;
  //if I use (!text || !like) is mean they have to update both
  if (!text && !likes) {
    return res.send({
      success: false,
      error: "You need to provide text or like to update.",
    });
  }

  const existingMessage = await prisma.message.update({
    where: { id: messageId },
    data: { text, likes },
  });
  res.send({
    success: true,
    existingMessage,
  });
});

app.delete("/messages/:messageId", async (req, res) => {
  const { messageId } = req.params;

  const deleteMessage = await prisma.message.delete({
    where: { id: messageId },
  });
  res.send({
    success: true,
    deleteMessage,
  });
});
app.use((error, req, res, next) => {
  res.send({
    success: false,
    error: error.message,
  });
});
const port = 3000;
app.listen(port, () => {
  console.log(`app listening on port ${port}`);
});
