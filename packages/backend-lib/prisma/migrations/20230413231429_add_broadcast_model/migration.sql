-- CreateEnum
CREATE TYPE "CompletionStatus" AS ENUM ('NotStarted', 'InProgress', 'Successful', 'Failed');

-- CreateTable
CREATE TABLE "Broadcast" (
    "id" UUID NOT NULL,
    "workspaceId" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "status" "CompletionStatus" NOT NULL DEFAULT 'NotStarted',
    "triggeredAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Broadcast_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Broadcast_workspaceId_name_key" ON "Broadcast"("workspaceId", "name");

-- AddForeignKey
ALTER TABLE "Broadcast" ADD CONSTRAINT "Broadcast_workspaceId_fkey" FOREIGN KEY ("workspaceId") REFERENCES "Workspace"("id") ON DELETE RESTRICT ON UPDATE CASCADE;