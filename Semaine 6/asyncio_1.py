import asyncio

async def producteur(q):
    for i in range(3):
        await asyncio.sleep(0.1)
        await q.put(i)
        print("Prod ->", i)
    await q.put(None)  # Sentinelle fin

async def consommateur(q):
    while True:
        item = await q.get()
        if item is None:
            break
        print("Cons <-", item)
        await asyncio.sleep(0.2)

async def main():
    q = asyncio.Queue()
    await asyncio.gather(producteur(q), consommateur(q))


async def foo():
    await producteur(asyncio.Queue())

async def bar():
    await consommateur(asyncio.Queue())

asyncio.run(main())
# foo()
# bar()

# asyncio.run(main())