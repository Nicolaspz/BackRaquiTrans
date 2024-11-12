/*
  Warnings:

  - You are about to drop the column `tipo_pagemento` on the `users` table. All the data in the column will be lost.
  - Added the required column `tipo_pagamento` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `users` DROP COLUMN `tipo_pagemento`,
    ADD COLUMN `tipo_pagamento` ENUM('SEMANAL', 'QUINZENAL', 'MENSAL') NOT NULL;
