import { timestamp } from 'drizzle-orm/pg-core';
import { text, integer, sqliteTable } from 'drizzle-orm/sqlite-core';

export const messages = sqliteTable('messages', {
  id: integer('id').primaryKey(),
  content: text('content').notNull(),
  chatId: text('chatId').notNull(),
  messageId: text('messageId').notNull(),
  role: text('type', { enum: ['assistant', 'user'] }),
  metadata: text('metadata', {
    mode: 'json',
  }),
});

export const chats = sqliteTable('chats', {
  id: text('id').primaryKey(),
  title: text('title').notNull(),
  createdAt: text('createdAt').notNull(),
  focusMode: text('focusMode').notNull(),
});

export const authSettings = sqliteTable('auth_settings', {
  id: integer('id').primaryKey({ autoIncrement: true }),
  isEnabled: integer('is_enabled', { mode: 'boolean' }).notNull().default(false),
  username: text('username'),
  password: text('password'),
});