/*
  Warnings:

  - A unique constraint covering the columns `[proces_number]` on the table `users` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `proces_number` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `users` ADD COLUMN `proces_number` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `users_proces_number_key` ON `users`(`proces_number`);
