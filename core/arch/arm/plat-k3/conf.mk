CFG_WITH_STATS ?= y
CFG_CRYPTO_WITH_CE ?= n
CFG_WITH_SOFTWARE_PRNG ?= n
CFG_CONSOLE_UART ?= 0

CFG_TZDRAM_START ?= 0x9e800000
CFG_TZDRAM_SIZE ?= 0x01400000 # 20MB
CFG_SHMEM_START ?= ($(CFG_TZDRAM_START) + $(CFG_TZDRAM_SIZE))
CFG_SHMEM_SIZE ?= 0x00400000 # 4MB

$(call force,CFG_TEE_CORE_NB_CORE,8)
$(call force,CFG_8250_UART,y)
$(call force,CFG_HWSUPP_MEM_PERM_PXN,y)
$(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)
$(call force,CFG_WITH_ARM_TRUSTED_FW,y)
$(call force,CFG_GIC,y)
$(call force,CFG_ARM_GICV3,y)
$(call force,CFG_CORE_CLUSTER_SHIFT,1)

ifneq ($(CFG_WITH_SOFTWARE_PRNG),y)
$(call force,CFG_SA2UL,y)
CFG_HWRNG_QUALITY ?= 1024
CFG_HWRNG_PTA ?= y
endif

include core/arch/arm/cpu/cortex-armv8-0.mk
