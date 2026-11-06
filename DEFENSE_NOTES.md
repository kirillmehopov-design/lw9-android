# Defense: simple answers

**Why do you have `models`, `data`, `providers`, `screens`, `widgets` folders?**
- EN: I separate product data, cart logic, pages and reusable UI so the code is easier to understand.
- RU: Я разделил данные, логику корзины, экраны и элементы интерфейса, чтобы код было проще объяснять и изменять.

**Why `CartProvider extends ChangeNotifier`?**
- EN: It stores one shared cart and tells listening widgets when cart data changes.
- RU: Он хранит одну общую корзину и сообщает интерфейсу о её изменениях.

**Why wrap `MaterialApp` in `ChangeNotifierProvider`?**
- EN: Both screens are below the provider, so they access the same cart instance.
- RU: Оба экрана получают доступ к одному объекту корзины.

**What does `notifyListeners()` do?**
- EN: It informs listeners that they should rebuild with the latest cart values.
- RU: Уведомляет подписанные виджеты, что корзина изменилась.

**Why `Consumer<CartProvider>` for the badge and cart view?**
- EN: They need to rebuild when the number of products or total price changes.
- RU: Число товаров и общая стоимость должны меняться сразу.

**Why `context.select` in `ProductCard`?**
- EN: Each card listens only to whether its own product is added.
- RU: Карточка обновляется только при изменении состояния именно её товара.

**Why `context.read` in onPressed?**
- EN: I call a cart method on click. I do not need to subscribe in that callback.
- RU: На нажатие просто вызывается команда, подписываться на обновления не нужно.

**What does `toggleProduct()` do?**
- EN: If the product is in the cart, remove it; otherwise, add it.
- RU: Если товар есть — удалить, если нет — добавить.

**How does total price work?**
- EN: `fold(0.0, (sum, p) => sum + p.price)` adds the prices of selected products.
- RU: Метод fold складывает цены выбранных товаров.

**How does synchronization work between screens?**
- EN: Both screens use the same provider. Each change calls notifyListeners, which updates badge, buttons and total.
- RU: Оба экрана используют одну корзину. notifyListeners обновляет счётчик, кнопки и общую цену.

**Why not use setState for the shared cart?**
- EN: setState is normally local to a widget, but the cart must be shared by two screens.
- RU: setState удобно для локального состояния, но здесь состояние нужно разделить между экранами.
