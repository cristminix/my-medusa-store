# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Medusa v2 e-commerce backend store with custom modules, notification provider, fulfillment provider, and email verification flow.

## Commands

### Development
```bash
pnpm dev          # Start development server with hot reload
pnpm build        # Build for production
pnpm start        # Start production server
pnpm seed         # Run seed script (src/scripts/seed.ts)
```

### Database
```bash
npx medusa db:generate <module-name>  # Generate migrations for a module
npx medusa db:migrate                 # Run pending migrations
```

### Testing
```bash
# Integration tests (HTTP endpoints)
pnpm test:integration:http

# Module integration tests
pnpm test:integration:modules

# Unit tests
pnpm test:unit
```

Test file locations:
- HTTP integration tests: `integration-tests/http/*.spec.ts`
- Module tests: `src/modules/*/__tests__/**/*.[jt]s`
- Unit tests: `src/**/__tests__/**/*.unit.spec.[jt]s`

## Architecture

### Custom Modules

**Resend Notification Provider** (`src/modules/resend/`)
- Extends `AbstractNotificationProviderService`
- Handles email delivery via Resend API
- Built-in templates: `password-reset`, `email-verification`
- Configured in `medusa-config.ts` with `RESEND_API_KEY` and `RESEND_FROM_EMAIL`

**Internal Shipping Provider** (`src/modules/internal-shipping/`)
- Extends `AbstractFulfillmentProviderService`
- Weight-based shipping calculation (base_rate + rate_per_kg)
- Options: `internal-standard` and `internal-express` (1.5x multiplier)

### Email Verification Flow

1. **Subscriber** (`src/subscribers/customer-created.ts`): On `customer.created` event, generates token and sends verification email
2. **API Route** (`src/api/store/verify-email/route.ts`):
   - `GET`: Verify email with token and email query params
   - `POST`: Resend verification email (requires auth)
3. **Middleware** (`src/api/middlewares.ts`): Blocks store access for unverified customers (returns 403 with `email_not_verified` type)

### Admin Customizations

- Indonesian language enforcement via widget (`src/admin/widgets/language-default.tsx`)
- Custom translations in `src/admin/i18n/json/id.json`

### Configuration

Key environment variables (see `medusa-config.ts`):
- `DATABASE_URL`, `REDIS_URL`
- `STORE_CORS`, `ADMIN_CORS`, `AUTH_CORS`
- `MEDUSA_BACKEND_URL`, `MEDUSA_STOREFRONT_URL`
- `RESEND_API_KEY`, `RESEND_FROM_EMAIL`

## Medusa Patterns

When building Medusa features, use the available skills:
- `/medusa-dev:building-with-medusa` - Backend modules, API routes, workflows
- `/medusa-dev:building-storefronts` - Storefront SDK integration
- `/medusa-dev:building-admin-dashboard-customizations` - Admin UI widgets and pages
