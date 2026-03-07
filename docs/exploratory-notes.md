# Exploratory Testing Session Notes

**Application**: OpenCart Demo
**Session Date**: 2024-01-18
**Tester**: Luis Elizondo
**Duration**: 60 minutes
**Charter**: Explore the checkout and cart flow looking for unexpected behavior

---

## Session Goal
Explore the cart and checkout process on OpenCart Demo to identify any unexpected behavior, usability issues, or functional bugs not covered by scripted test cases.

---

## Areas Explored

### 1. Cart Behavior
- Added multiple quantities of the same product - PASS
- Added products from different categories - PASS
- Attempted to add out-of-stock product (button disabled) - PASS
- Manually changed URL to add product by ID - product added unexpectedly - WARNING

**Note**: Navigating directly to /cart?product_id=40&quantity=99 adds a product with quantity 99 bypassing stock validation on the UI.

### 2. Checkout Flow
- Completed full guest checkout flow - PASS
- Completed registered user checkout - PASS
- Left required fields empty - validation works correctly - PASS
- Entered invalid postcode format - no format validation found - WARNING

**Note**: Postcode field accepts any string including letters and special characters.

### 3. Coupon Code Field
- Entered valid coupon - accepted - PASS
- Entered invalid coupon - error shown - PASS
- Entered empty coupon and submitted - silent failure, no error shown - WARNING

### 4. Navigation Edge Cases
- Used browser back button during checkout - correctly prompts re-entry - PASS
- Opened checkout in two browser tabs - both processed independently - PASS

---

## Bugs Found During Session

| ID | Summary | Severity |
|----|---------|---------|
| BUG-004 | Postcode field accepts any string, no format validation | Low |
| BUG-005 | Empty coupon code submission fails silently | Low |
| BUG-006 | Direct URL allows adding out-of-stock products to cart | Medium |

---

## Observations

- Checkout flow is 3 steps which is intuitive
- Error messages are clear and descriptive throughout
- Mobile responsiveness seems broken below 400px width
- Session cookies persist longer than expected after logout

---

## Time Log

| Time | Activity |
|------|---------|
| 0-10 min | Cart add/remove/update flows |
| 10-25 min | Checkout guest flow |
| 25-40 min | Checkout registered user flow |
| 40-50 min | Coupon and promo code fields |
| 50-60 min | Edge cases and URL manipulation |