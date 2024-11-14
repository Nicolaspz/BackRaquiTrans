-- CreateTable
CREATE TABLE `servicos` (
    `id` VARCHAR(191) NOT NULL,
    `tipo` ENUM('ENTREGA', 'MOTORISTA_PESSOAL') NOT NULL,
    `status` ENUM('PENDENTE', 'ACEITO', 'EM_ANDAMENTO', 'CONCLUIDO') NOT NULL DEFAULT 'PENDENTE',
    `descricao` VARCHAR(191) NULL,
    `data_solicitacao` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `data_atualizacao` DATETIME(3) NOT NULL,
    `usuarioId` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `interacoes` (
    `id` VARCHAR(191) NOT NULL,
    `conteudo` VARCHAR(191) NOT NULL,
    `autorId` VARCHAR(191) NOT NULL,
    `servicoId` VARCHAR(191) NOT NULL,
    `criado_em` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `tipo` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` VARCHAR(191) NOT NULL,
    `proces_number` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `user_name` VARCHAR(191) NOT NULL,
    `nif` VARCHAR(191) NOT NULL,
    `morada` VARCHAR(191) NOT NULL,
    `role` ENUM('ADMIN', 'CLIENT') NOT NULL,
    `redes` VARCHAR(191) NOT NULL,
    `tipo_pagamento` ENUM('CONTA_3DIAS', 'CONTA_7DIAS', 'CONTA_15DIAS', 'CONTA_30DIAS') NOT NULL,
    `telefone` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `users_proces_number_key`(`proces_number`),
    UNIQUE INDEX `users_email_key`(`email`),
    UNIQUE INDEX `users_telefone_key`(`telefone`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `servicos` ADD CONSTRAINT `servicos_usuarioId_fkey` FOREIGN KEY (`usuarioId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `interacoes` ADD CONSTRAINT `interacoes_autorId_fkey` FOREIGN KEY (`autorId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `interacoes` ADD CONSTRAINT `interacoes_servicoId_fkey` FOREIGN KEY (`servicoId`) REFERENCES `servicos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
