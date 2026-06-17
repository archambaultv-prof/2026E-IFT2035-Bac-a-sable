import asyncio

async def long():
    try:
        for i in range(5):
            await asyncio.sleep(0.3)
            print("tick", i)
    except asyncio.CancelledError:
        print("Annulé proprement")
        raise  # Re-propager si nécessaire

async def main():
    t = asyncio.create_task(long())
    await asyncio.sleep(0.8)
    t.cancel()
    try:
        await t
    except asyncio.CancelledError:
        print("Connu : task annulée")

asyncio.run(main())