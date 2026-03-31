# LinkedIn Post - Day 2

## Post Draft

---

**Angular Signals in 2026: Everything You Need to Know 🧵**

If you're still using `ngOnChanges` in 2026, this thread is for you.

Angular Signals changed how we write Angular. Here's what actually matters:

1/ **What are Signals?**
Signals are reactive primitives that hold values. When the value changes, everything that depends on it updates automatically.

```typescript
count = signal(0);

// Reading
count(); // → 0

// Writing
count.set(5);
count.update((c) => c + 1);
```

2/ **Computed Signals**
Derived state that automatically updates when dependencies change:

```typescript
doubleCount = computed(() => count() * 2);
```

No more manual subscriptions. No more `ngOnDestroy`. Just pure reactivity.

3/ **Effects for Side Effects**
Run code when signals change:

```typescript
effect(() => {
  console.log(`Count is now: ${count()}`);
});
```

Perfect for logging, analytics, or syncing with localStorage.

4/ **The Real Benefit**
Before Signals: manual change detection, subscription management, memory leaks.

After Signals: Angular knows exactly what changed. Performance improves automatically.

5/ **Migration Strategy**

- Start with new components using signals
- Use `toSignal()` to convert observables
- Keep `ngOnChanges` for `@Input()` but plan to migrate
- Signals + OnPush = 🚀

The learning curve is minimal. The performance gains are substantial.

Are you already using signals in production? 👇

---

_#Angular #AngularSignals #WebDevelopment #TypeScript #Frontend #Angular16 #Signals #ReactiveProgramming_
