
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000b117          	auipc	sp,0xb
    80000004:	7f013103          	ld	sp,2032(sp) # 8000b7f0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1cd060ef          	jal	ra,800069e8 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <interruptTable>:
.align 4

.global interruptTable
interruptTable:
    j ecallTrap
    80001000:	0280006f          	j	80001028 <ecallTrap>
    j timerTrap
    80001004:	1340006f          	j	80001138 <timerTrap>
	...
    .skip 28
    j consoleTrap
    80001024:	2240006f          	j	80001248 <consoleTrap>

0000000080001028 <ecallTrap>:


.extern ecallHandleTrap
.global ecallTrap
ecallTrap:
    addi sp, sp, -256
    80001028:	f0010113          	addi	sp,sp,-256

    sd x0, 0x00(sp)
    8000102c:	00013023          	sd	zero,0(sp)
    sd x1, 0x08(sp)
    80001030:	00113423          	sd	ra,8(sp)
    sd x2, 0x10(sp)
    80001034:	00213823          	sd	sp,16(sp)
    sd x3, 0x18(sp)
    80001038:	00313c23          	sd	gp,24(sp)
    sd x4, 0x20(sp)
    8000103c:	02413023          	sd	tp,32(sp)
    sd x5, 0x28(sp)
    80001040:	02513423          	sd	t0,40(sp)
    sd x6, 0x30(sp)
    80001044:	02613823          	sd	t1,48(sp)
    sd x7, 0x38(sp)
    80001048:	02713c23          	sd	t2,56(sp)
    sd x8, 0x40(sp)
    8000104c:	04813023          	sd	s0,64(sp)
    sd x9, 0x48(sp)
    80001050:	04913423          	sd	s1,72(sp)
    sd x10, 0x50(sp)
    80001054:	04a13823          	sd	a0,80(sp)
    sd x11, 0x58(sp)
    80001058:	04b13c23          	sd	a1,88(sp)
    sd x12, 0x60(sp)
    8000105c:	06c13023          	sd	a2,96(sp)
    sd x13, 0x68(sp)
    80001060:	06d13423          	sd	a3,104(sp)
    sd x14, 0x70(sp)
    80001064:	06e13823          	sd	a4,112(sp)
    sd x15, 0x78(sp)
    80001068:	06f13c23          	sd	a5,120(sp)
    sd x16, 0x80(sp)
    8000106c:	09013023          	sd	a6,128(sp)
    sd x17, 0x88(sp)
    80001070:	09113423          	sd	a7,136(sp)
    sd x18, 0x90(sp)
    80001074:	09213823          	sd	s2,144(sp)
    sd x19, 0x98(sp)
    80001078:	09313c23          	sd	s3,152(sp)
    sd x20, 0xa0(sp)
    8000107c:	0b413023          	sd	s4,160(sp)
    sd x21, 0xa8(sp)
    80001080:	0b513423          	sd	s5,168(sp)
    sd x22, 0xb0(sp)
    80001084:	0b613823          	sd	s6,176(sp)
    sd x23, 0xb8(sp)
    80001088:	0b713c23          	sd	s7,184(sp)
    sd x24, 0xc0(sp)
    8000108c:	0d813023          	sd	s8,192(sp)
    sd x25, 0xc8(sp)
    80001090:	0d913423          	sd	s9,200(sp)
    sd x26, 0xd0(sp)
    80001094:	0da13823          	sd	s10,208(sp)
    sd x27, 0xd8(sp)
    80001098:	0db13c23          	sd	s11,216(sp)
    sd x28, 0xe0(sp)
    8000109c:	0fc13023          	sd	t3,224(sp)
    sd x29, 0xe8(sp)
    800010a0:	0fd13423          	sd	t4,232(sp)
    sd x30, 0xf0(sp)
    800010a4:	0fe13823          	sd	t5,240(sp)
    sd x31, 0xf8(sp)
    800010a8:	0ff13c23          	sd	t6,248(sp)

    call ecallHandleTrap
    800010ac:	749010ef          	jal	ra,80002ff4 <ecallHandleTrap>

    ld x0, 0x00(sp)
    800010b0:	00013003          	ld	zero,0(sp)
    ld x1, 0x08(sp)
    800010b4:	00813083          	ld	ra,8(sp)
    ld x2, 0x10(sp)
    800010b8:	01013103          	ld	sp,16(sp)
    ld x3, 0x18(sp)
    800010bc:	01813183          	ld	gp,24(sp)
    ld x4, 0x20(sp)
    800010c0:	02013203          	ld	tp,32(sp)
    ld x5, 0x28(sp)
    800010c4:	02813283          	ld	t0,40(sp)
    ld x6, 0x30(sp)
    800010c8:	03013303          	ld	t1,48(sp)
    ld x7, 0x38(sp)
    800010cc:	03813383          	ld	t2,56(sp)
    ld x8, 0x40(sp)
    800010d0:	04013403          	ld	s0,64(sp)
    ld x9, 0x48(sp)
    800010d4:	04813483          	ld	s1,72(sp)
    ld x10, 0x50(sp)
    800010d8:	05013503          	ld	a0,80(sp)
    ld x11, 0x58(sp)
    800010dc:	05813583          	ld	a1,88(sp)
    ld x12, 0x60(sp)
    800010e0:	06013603          	ld	a2,96(sp)
    ld x13, 0x68(sp)
    800010e4:	06813683          	ld	a3,104(sp)
    ld x14, 0x70(sp)
    800010e8:	07013703          	ld	a4,112(sp)
    ld x15, 0x78(sp)
    800010ec:	07813783          	ld	a5,120(sp)
    ld x16, 0x80(sp)
    800010f0:	08013803          	ld	a6,128(sp)
    ld x17, 0x88(sp)
    800010f4:	08813883          	ld	a7,136(sp)
    ld x18, 0x90(sp)
    800010f8:	09013903          	ld	s2,144(sp)
    ld x19, 0x98(sp)
    800010fc:	09813983          	ld	s3,152(sp)
    ld x20, 0xa0(sp)
    80001100:	0a013a03          	ld	s4,160(sp)
    ld x21, 0xa8(sp)
    80001104:	0a813a83          	ld	s5,168(sp)
    ld x22, 0xb0(sp)
    80001108:	0b013b03          	ld	s6,176(sp)
    ld x23, 0xb8(sp)
    8000110c:	0b813b83          	ld	s7,184(sp)
    ld x24, 0xc0(sp)
    80001110:	0c013c03          	ld	s8,192(sp)
    ld x25, 0xc8(sp)
    80001114:	0c813c83          	ld	s9,200(sp)
    ld x26, 0xd0(sp)
    80001118:	0d013d03          	ld	s10,208(sp)
    ld x27, 0xd8(sp)
    8000111c:	0d813d83          	ld	s11,216(sp)
    ld x28, 0xe0(sp)
    80001120:	0e013e03          	ld	t3,224(sp)
    ld x29, 0xe8(sp)
    80001124:	0e813e83          	ld	t4,232(sp)
    ld x30, 0xf0(sp)
    80001128:	0f013f03          	ld	t5,240(sp)
    ld x31, 0xf8(sp)
    8000112c:	0f813f83          	ld	t6,248(sp)

    addi sp, sp, 256
    80001130:	10010113          	addi	sp,sp,256
    sret
    80001134:	10200073          	sret

0000000080001138 <timerTrap>:


.extern timerHandleTrap
.global timerTrap
timerTrap:
    addi sp, sp, -256
    80001138:	f0010113          	addi	sp,sp,-256

    sd x0, 0x00(sp)
    8000113c:	00013023          	sd	zero,0(sp)
    sd x1, 0x08(sp)
    80001140:	00113423          	sd	ra,8(sp)
    sd x2, 0x10(sp)
    80001144:	00213823          	sd	sp,16(sp)
    sd x3, 0x18(sp)
    80001148:	00313c23          	sd	gp,24(sp)
    sd x4, 0x20(sp)
    8000114c:	02413023          	sd	tp,32(sp)
    sd x5, 0x28(sp)
    80001150:	02513423          	sd	t0,40(sp)
    sd x6, 0x30(sp)
    80001154:	02613823          	sd	t1,48(sp)
    sd x7, 0x38(sp)
    80001158:	02713c23          	sd	t2,56(sp)
    sd x8, 0x40(sp)
    8000115c:	04813023          	sd	s0,64(sp)
    sd x9, 0x48(sp)
    80001160:	04913423          	sd	s1,72(sp)
    sd x10, 0x50(sp)
    80001164:	04a13823          	sd	a0,80(sp)
    sd x11, 0x58(sp)
    80001168:	04b13c23          	sd	a1,88(sp)
    sd x12, 0x60(sp)
    8000116c:	06c13023          	sd	a2,96(sp)
    sd x13, 0x68(sp)
    80001170:	06d13423          	sd	a3,104(sp)
    sd x14, 0x70(sp)
    80001174:	06e13823          	sd	a4,112(sp)
    sd x15, 0x78(sp)
    80001178:	06f13c23          	sd	a5,120(sp)
    sd x16, 0x80(sp)
    8000117c:	09013023          	sd	a6,128(sp)
    sd x17, 0x88(sp)
    80001180:	09113423          	sd	a7,136(sp)
    sd x18, 0x90(sp)
    80001184:	09213823          	sd	s2,144(sp)
    sd x19, 0x98(sp)
    80001188:	09313c23          	sd	s3,152(sp)
    sd x20, 0xa0(sp)
    8000118c:	0b413023          	sd	s4,160(sp)
    sd x21, 0xa8(sp)
    80001190:	0b513423          	sd	s5,168(sp)
    sd x22, 0xb0(sp)
    80001194:	0b613823          	sd	s6,176(sp)
    sd x23, 0xb8(sp)
    80001198:	0b713c23          	sd	s7,184(sp)
    sd x24, 0xc0(sp)
    8000119c:	0d813023          	sd	s8,192(sp)
    sd x25, 0xc8(sp)
    800011a0:	0d913423          	sd	s9,200(sp)
    sd x26, 0xd0(sp)
    800011a4:	0da13823          	sd	s10,208(sp)
    sd x27, 0xd8(sp)
    800011a8:	0db13c23          	sd	s11,216(sp)
    sd x28, 0xe0(sp)
    800011ac:	0fc13023          	sd	t3,224(sp)
    sd x29, 0xe8(sp)
    800011b0:	0fd13423          	sd	t4,232(sp)
    sd x30, 0xf0(sp)
    800011b4:	0fe13823          	sd	t5,240(sp)
    sd x31, 0xf8(sp)
    800011b8:	0ff13c23          	sd	t6,248(sp)

    call timerHandleTrap
    800011bc:	000020ef          	jal	ra,800031bc <timerHandleTrap>

    ld x0, 0x00(sp)
    800011c0:	00013003          	ld	zero,0(sp)
    ld x1, 0x08(sp)
    800011c4:	00813083          	ld	ra,8(sp)
    ld x2, 0x10(sp)
    800011c8:	01013103          	ld	sp,16(sp)
    ld x3, 0x18(sp)
    800011cc:	01813183          	ld	gp,24(sp)
    ld x4, 0x20(sp)
    800011d0:	02013203          	ld	tp,32(sp)
    ld x5, 0x28(sp)
    800011d4:	02813283          	ld	t0,40(sp)
    ld x6, 0x30(sp)
    800011d8:	03013303          	ld	t1,48(sp)
    ld x7, 0x38(sp)
    800011dc:	03813383          	ld	t2,56(sp)
    ld x8, 0x40(sp)
    800011e0:	04013403          	ld	s0,64(sp)
    ld x9, 0x48(sp)
    800011e4:	04813483          	ld	s1,72(sp)
    ld x10, 0x50(sp)
    800011e8:	05013503          	ld	a0,80(sp)
    ld x11, 0x58(sp)
    800011ec:	05813583          	ld	a1,88(sp)
    ld x12, 0x60(sp)
    800011f0:	06013603          	ld	a2,96(sp)
    ld x13, 0x68(sp)
    800011f4:	06813683          	ld	a3,104(sp)
    ld x14, 0x70(sp)
    800011f8:	07013703          	ld	a4,112(sp)
    ld x15, 0x78(sp)
    800011fc:	07813783          	ld	a5,120(sp)
    ld x16, 0x80(sp)
    80001200:	08013803          	ld	a6,128(sp)
    ld x17, 0x88(sp)
    80001204:	08813883          	ld	a7,136(sp)
    ld x18, 0x90(sp)
    80001208:	09013903          	ld	s2,144(sp)
    ld x19, 0x98(sp)
    8000120c:	09813983          	ld	s3,152(sp)
    ld x20, 0xa0(sp)
    80001210:	0a013a03          	ld	s4,160(sp)
    ld x21, 0xa8(sp)
    80001214:	0a813a83          	ld	s5,168(sp)
    ld x22, 0xb0(sp)
    80001218:	0b013b03          	ld	s6,176(sp)
    ld x23, 0xb8(sp)
    8000121c:	0b813b83          	ld	s7,184(sp)
    ld x24, 0xc0(sp)
    80001220:	0c013c03          	ld	s8,192(sp)
    ld x25, 0xc8(sp)
    80001224:	0c813c83          	ld	s9,200(sp)
    ld x26, 0xd0(sp)
    80001228:	0d013d03          	ld	s10,208(sp)
    ld x27, 0xd8(sp)
    8000122c:	0d813d83          	ld	s11,216(sp)
    ld x28, 0xe0(sp)
    80001230:	0e013e03          	ld	t3,224(sp)
    ld x29, 0xe8(sp)
    80001234:	0e813e83          	ld	t4,232(sp)
    ld x30, 0xf0(sp)
    80001238:	0f013f03          	ld	t5,240(sp)
    ld x31, 0xf8(sp)
    8000123c:	0f813f83          	ld	t6,248(sp)

    addi sp, sp, 256
    80001240:	10010113          	addi	sp,sp,256
    sret
    80001244:	10200073          	sret

0000000080001248 <consoleTrap>:


.extern consoleHandleTrap
.global consoleTrap
consoleTrap:
    addi sp, sp, -256
    80001248:	f0010113          	addi	sp,sp,-256

    sd x0, 0x00(sp)
    8000124c:	00013023          	sd	zero,0(sp)
    sd x1, 0x08(sp)
    80001250:	00113423          	sd	ra,8(sp)
    sd x2, 0x10(sp)
    80001254:	00213823          	sd	sp,16(sp)
    sd x3, 0x18(sp)
    80001258:	00313c23          	sd	gp,24(sp)
    sd x4, 0x20(sp)
    8000125c:	02413023          	sd	tp,32(sp)
    sd x5, 0x28(sp)
    80001260:	02513423          	sd	t0,40(sp)
    sd x6, 0x30(sp)
    80001264:	02613823          	sd	t1,48(sp)
    sd x7, 0x38(sp)
    80001268:	02713c23          	sd	t2,56(sp)
    sd x8, 0x40(sp)
    8000126c:	04813023          	sd	s0,64(sp)
    sd x9, 0x48(sp)
    80001270:	04913423          	sd	s1,72(sp)
    sd x10, 0x50(sp)
    80001274:	04a13823          	sd	a0,80(sp)
    sd x11, 0x58(sp)
    80001278:	04b13c23          	sd	a1,88(sp)
    sd x12, 0x60(sp)
    8000127c:	06c13023          	sd	a2,96(sp)
    sd x13, 0x68(sp)
    80001280:	06d13423          	sd	a3,104(sp)
    sd x14, 0x70(sp)
    80001284:	06e13823          	sd	a4,112(sp)
    sd x15, 0x78(sp)
    80001288:	06f13c23          	sd	a5,120(sp)
    sd x16, 0x80(sp)
    8000128c:	09013023          	sd	a6,128(sp)
    sd x17, 0x88(sp)
    80001290:	09113423          	sd	a7,136(sp)
    sd x18, 0x90(sp)
    80001294:	09213823          	sd	s2,144(sp)
    sd x19, 0x98(sp)
    80001298:	09313c23          	sd	s3,152(sp)
    sd x20, 0xa0(sp)
    8000129c:	0b413023          	sd	s4,160(sp)
    sd x21, 0xa8(sp)
    800012a0:	0b513423          	sd	s5,168(sp)
    sd x22, 0xb0(sp)
    800012a4:	0b613823          	sd	s6,176(sp)
    sd x23, 0xb8(sp)
    800012a8:	0b713c23          	sd	s7,184(sp)
    sd x24, 0xc0(sp)
    800012ac:	0d813023          	sd	s8,192(sp)
    sd x25, 0xc8(sp)
    800012b0:	0d913423          	sd	s9,200(sp)
    sd x26, 0xd0(sp)
    800012b4:	0da13823          	sd	s10,208(sp)
    sd x27, 0xd8(sp)
    800012b8:	0db13c23          	sd	s11,216(sp)
    sd x28, 0xe0(sp)
    800012bc:	0fc13023          	sd	t3,224(sp)
    sd x29, 0xe8(sp)
    800012c0:	0fd13423          	sd	t4,232(sp)
    sd x30, 0xf0(sp)
    800012c4:	0fe13823          	sd	t5,240(sp)
    sd x31, 0xf8(sp)
    800012c8:	0ff13c23          	sd	t6,248(sp)

    call consoleHandleTrap
    800012cc:	7a1010ef          	jal	ra,8000326c <consoleHandleTrap>

    ld x0, 0x00(sp)
    800012d0:	00013003          	ld	zero,0(sp)
    ld x1, 0x08(sp)
    800012d4:	00813083          	ld	ra,8(sp)
    ld x2, 0x10(sp)
    800012d8:	01013103          	ld	sp,16(sp)
    ld x3, 0x18(sp)
    800012dc:	01813183          	ld	gp,24(sp)
    ld x4, 0x20(sp)
    800012e0:	02013203          	ld	tp,32(sp)
    ld x5, 0x28(sp)
    800012e4:	02813283          	ld	t0,40(sp)
    ld x6, 0x30(sp)
    800012e8:	03013303          	ld	t1,48(sp)
    ld x7, 0x38(sp)
    800012ec:	03813383          	ld	t2,56(sp)
    ld x8, 0x40(sp)
    800012f0:	04013403          	ld	s0,64(sp)
    ld x9, 0x48(sp)
    800012f4:	04813483          	ld	s1,72(sp)
    ld x10, 0x50(sp)
    800012f8:	05013503          	ld	a0,80(sp)
    ld x11, 0x58(sp)
    800012fc:	05813583          	ld	a1,88(sp)
    ld x12, 0x60(sp)
    80001300:	06013603          	ld	a2,96(sp)
    ld x13, 0x68(sp)
    80001304:	06813683          	ld	a3,104(sp)
    ld x14, 0x70(sp)
    80001308:	07013703          	ld	a4,112(sp)
    ld x15, 0x78(sp)
    8000130c:	07813783          	ld	a5,120(sp)
    ld x16, 0x80(sp)
    80001310:	08013803          	ld	a6,128(sp)
    ld x17, 0x88(sp)
    80001314:	08813883          	ld	a7,136(sp)
    ld x18, 0x90(sp)
    80001318:	09013903          	ld	s2,144(sp)
    ld x19, 0x98(sp)
    8000131c:	09813983          	ld	s3,152(sp)
    ld x20, 0xa0(sp)
    80001320:	0a013a03          	ld	s4,160(sp)
    ld x21, 0xa8(sp)
    80001324:	0a813a83          	ld	s5,168(sp)
    ld x22, 0xb0(sp)
    80001328:	0b013b03          	ld	s6,176(sp)
    ld x23, 0xb8(sp)
    8000132c:	0b813b83          	ld	s7,184(sp)
    ld x24, 0xc0(sp)
    80001330:	0c013c03          	ld	s8,192(sp)
    ld x25, 0xc8(sp)
    80001334:	0c813c83          	ld	s9,200(sp)
    ld x26, 0xd0(sp)
    80001338:	0d013d03          	ld	s10,208(sp)
    ld x27, 0xd8(sp)
    8000133c:	0d813d83          	ld	s11,216(sp)
    ld x28, 0xe0(sp)
    80001340:	0e013e03          	ld	t3,224(sp)
    ld x29, 0xe8(sp)
    80001344:	0e813e83          	ld	t4,232(sp)
    ld x30, 0xf0(sp)
    80001348:	0f013f03          	ld	t5,240(sp)
    ld x31, 0xf8(sp)
    8000134c:	0f813f83          	ld	t6,248(sp)

    addi sp, sp, 256
    80001350:	10010113          	addi	sp,sp,256
    sret
    80001354:	10200073          	sret

0000000080001358 <contextSwitch>:
.type contextSwitch, @function
contextSwitch:
    # a0 - &old->context
    # a1 - &running->context

    sd sp, 0(a0)
    80001358:	00253023          	sd	sp,0(a0) # 1000 <_entry-0x7ffff000>
    sd ra, 8(a0)
    8000135c:	00153423          	sd	ra,8(a0)

    ld sp, 0(a1)
    80001360:	0005b103          	ld	sp,0(a1)
    ld ra, 8(a1)
    80001364:	0085b083          	ld	ra,8(a1)

    80001368:	00008067          	ret

000000008000136c <pushRegisters>:
.global pushRegisters
.type pushRegisters, @function
pushRegisters:
    addi sp, sp, -256
    8000136c:	f0010113          	addi	sp,sp,-256
    sd x3, 0x18(sp)
    80001370:	00313c23          	sd	gp,24(sp)
    sd x4, 0x20(sp)
    80001374:	02413023          	sd	tp,32(sp)
    sd x5, 0x28(sp)
    80001378:	02513423          	sd	t0,40(sp)
    sd x6, 0x30(sp)
    8000137c:	02613823          	sd	t1,48(sp)
    sd x7, 0x38(sp)
    80001380:	02713c23          	sd	t2,56(sp)
    sd x8, 0x40(sp)
    80001384:	04813023          	sd	s0,64(sp)
    sd x9, 0x48(sp)
    80001388:	04913423          	sd	s1,72(sp)
    sd x10, 0x50(sp)
    8000138c:	04a13823          	sd	a0,80(sp)
    sd x11, 0x58(sp)
    80001390:	04b13c23          	sd	a1,88(sp)
    sd x12, 0x60(sp)
    80001394:	06c13023          	sd	a2,96(sp)
    sd x13, 0x68(sp)
    80001398:	06d13423          	sd	a3,104(sp)
    sd x14, 0x70(sp)
    8000139c:	06e13823          	sd	a4,112(sp)
    sd x15, 0x78(sp)
    800013a0:	06f13c23          	sd	a5,120(sp)
    sd x16, 0x80(sp)
    800013a4:	09013023          	sd	a6,128(sp)
    sd x17, 0x88(sp)
    800013a8:	09113423          	sd	a7,136(sp)
    sd x18, 0x90(sp)
    800013ac:	09213823          	sd	s2,144(sp)
    sd x19, 0x98(sp)
    800013b0:	09313c23          	sd	s3,152(sp)
    sd x20, 0xa0(sp)
    800013b4:	0b413023          	sd	s4,160(sp)
    sd x21, 0xa8(sp)
    800013b8:	0b513423          	sd	s5,168(sp)
    sd x22, 0xb0(sp)
    800013bc:	0b613823          	sd	s6,176(sp)
    sd x23, 0xb8(sp)
    800013c0:	0b713c23          	sd	s7,184(sp)
    sd x24, 0xc0(sp)
    800013c4:	0d813023          	sd	s8,192(sp)
    sd x25, 0xc8(sp)
    800013c8:	0d913423          	sd	s9,200(sp)
    sd x26, 0xd0(sp)
    800013cc:	0da13823          	sd	s10,208(sp)
    sd x27, 0xd8(sp)
    800013d0:	0db13c23          	sd	s11,216(sp)
    sd x28, 0xe0(sp)
    800013d4:	0fc13023          	sd	t3,224(sp)
    sd x29, 0xe8(sp)
    800013d8:	0fd13423          	sd	t4,232(sp)
    sd x30, 0xf0(sp)
    800013dc:	0fe13823          	sd	t5,240(sp)
    sd x31, 0xf8(sp)
    800013e0:	0ff13c23          	sd	t6,248(sp)
    ret
    800013e4:	00008067          	ret

00000000800013e8 <popRegisters>:

.global popRegisters
.type popRegisters, @function
popRegisters:
    ld x3, 0x18(sp)
    800013e8:	01813183          	ld	gp,24(sp)
    ld x4, 0x20(sp)
    800013ec:	02013203          	ld	tp,32(sp)
    ld x5, 0x28(sp)
    800013f0:	02813283          	ld	t0,40(sp)
    ld x6, 0x30(sp)
    800013f4:	03013303          	ld	t1,48(sp)
    ld x7, 0x38(sp)
    800013f8:	03813383          	ld	t2,56(sp)
    ld x8, 0x40(sp)
    800013fc:	04013403          	ld	s0,64(sp)
    ld x9, 0x48(sp)
    80001400:	04813483          	ld	s1,72(sp)
    ld x10, 0x50(sp)
    80001404:	05013503          	ld	a0,80(sp)
    ld x11, 0x58(sp)
    80001408:	05813583          	ld	a1,88(sp)
    ld x12, 0x60(sp)
    8000140c:	06013603          	ld	a2,96(sp)
    ld x13, 0x68(sp)
    80001410:	06813683          	ld	a3,104(sp)
    ld x14, 0x70(sp)
    80001414:	07013703          	ld	a4,112(sp)
    ld x15, 0x78(sp)
    80001418:	07813783          	ld	a5,120(sp)
    ld x16, 0x80(sp)
    8000141c:	08013803          	ld	a6,128(sp)
    ld x17, 0x88(sp)
    80001420:	08813883          	ld	a7,136(sp)
    ld x18, 0x90(sp)
    80001424:	09013903          	ld	s2,144(sp)
    ld x19, 0x98(sp)
    80001428:	09813983          	ld	s3,152(sp)
    ld x20, 0xa0(sp)
    8000142c:	0a013a03          	ld	s4,160(sp)
    ld x21, 0xa8(sp)
    80001430:	0a813a83          	ld	s5,168(sp)
    ld x22, 0xb0(sp)
    80001434:	0b013b03          	ld	s6,176(sp)
    ld x23, 0xb8(sp)
    80001438:	0b813b83          	ld	s7,184(sp)
    ld x24, 0xc0(sp)
    8000143c:	0c013c03          	ld	s8,192(sp)
    ld x25, 0xc8(sp)
    80001440:	0c813c83          	ld	s9,200(sp)
    ld x26, 0xd0(sp)
    80001444:	0d013d03          	ld	s10,208(sp)
    ld x27, 0xd8(sp)
    80001448:	0d813d83          	ld	s11,216(sp)
    ld x28, 0xe0(sp)
    8000144c:	0e013e03          	ld	t3,224(sp)
    ld x29, 0xe8(sp)
    80001450:	0e813e83          	ld	t4,232(sp)
    ld x30, 0xf0(sp)
    80001454:	0f013f03          	ld	t5,240(sp)
    ld x31, 0xf8(sp)
    80001458:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    8000145c:	10010113          	addi	sp,sp,256
    ret
    80001460:	00008067          	ret

0000000080001464 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001464:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001468:	00b29a63          	bne	t0,a1,8000147c <fail>
    sc.w t0, a2, (a0)      # Try to update.
    8000146c:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001470:	fe029ae3          	bnez	t0,80001464 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001474:	00000513          	li	a0,0
    jr ra                  # Return.
    80001478:	00008067          	ret

000000008000147c <fail>:
    fail:
    li a0, 1               # Set return to failure.
    8000147c:	00100513          	li	a0,1
    80001480:	00008067          	ret

0000000080001484 <_Z7syscalliz>:
#include "../h/syscall_c.hpp"

void syscall(int id, ... ) {
    80001484:	fb010113          	addi	sp,sp,-80
    80001488:	00813423          	sd	s0,8(sp)
    8000148c:	01010413          	addi	s0,sp,16
    80001490:	00b43423          	sd	a1,8(s0)
    80001494:	00c43823          	sd	a2,16(s0)
    80001498:	00d43c23          	sd	a3,24(s0)
    8000149c:	02e43023          	sd	a4,32(s0)
    800014a0:	02f43423          	sd	a5,40(s0)
    800014a4:	03043823          	sd	a6,48(s0)
    800014a8:	03143c23          	sd	a7,56(s0)
    __asm__ volatile("ecall");
    800014ac:	00000073          	ecall
}
    800014b0:	00813403          	ld	s0,8(sp)
    800014b4:	05010113          	addi	sp,sp,80
    800014b8:	00008067          	ret

00000000800014bc <_Z9mem_allocm>:

void *mem_alloc(uint64 size) {
    800014bc:	ff010113          	addi	sp,sp,-16
    800014c0:	00113423          	sd	ra,8(sp)
    800014c4:	00813023          	sd	s0,0(sp)
    800014c8:	01010413          	addi	s0,sp,16
    size = (size + sizeof(MemoryAllocator::MemSegment) + MEM_BLOCK_SIZE - 1 ) / MEM_BLOCK_SIZE;
    800014cc:	05750593          	addi	a1,a0,87

    syscall(MEM_ALLOC_CODE, size);
    800014d0:	0065d593          	srli	a1,a1,0x6
    800014d4:	00100513          	li	a0,1
    800014d8:	00000097          	auipc	ra,0x0
    800014dc:	fac080e7          	jalr	-84(ra) # 80001484 <_Z7syscalliz>

    void *ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800014e0:	00050513          	mv	a0,a0
    return ret;
}
    800014e4:	00813083          	ld	ra,8(sp)
    800014e8:	00013403          	ld	s0,0(sp)
    800014ec:	01010113          	addi	sp,sp,16
    800014f0:	00008067          	ret

00000000800014f4 <_Z8mem_freePv>:

int mem_free(void* adress) {
    800014f4:	ff010113          	addi	sp,sp,-16
    800014f8:	00113423          	sd	ra,8(sp)
    800014fc:	00813023          	sd	s0,0(sp)
    80001500:	01010413          	addi	s0,sp,16
    80001504:	00050593          	mv	a1,a0
    syscall(MEM_FREE_CODE, adress);
    80001508:	00200513          	li	a0,2
    8000150c:	00000097          	auipc	ra,0x0
    80001510:	f78080e7          	jalr	-136(ra) # 80001484 <_Z7syscalliz>

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    80001514:	00050513          	mv	a0,a0
    return ret;
}
    80001518:	0005051b          	sext.w	a0,a0
    8000151c:	00813083          	ld	ra,8(sp)
    80001520:	00013403          	ld	s0,0(sp)
    80001524:	01010113          	addi	sp,sp,16
    80001528:	00008067          	ret

000000008000152c <_Z13thread_createPP3TCBPFvPvES2_>:


int thread_create(TCB **handle, void(*start_routine)(void*), void *arg) {
    8000152c:	fd010113          	addi	sp,sp,-48
    80001530:	02113423          	sd	ra,40(sp)
    80001534:	02813023          	sd	s0,32(sp)
    80001538:	00913c23          	sd	s1,24(sp)
    8000153c:	01213823          	sd	s2,16(sp)
    80001540:	01313423          	sd	s3,8(sp)
    80001544:	03010413          	addi	s0,sp,48
    80001548:	00050493          	mv	s1,a0
    8000154c:	00058913          	mv	s2,a1
    80001550:	00060993          	mv	s3,a2
    void *stack = (uint64*)(new uint64[DEFAULT_STACK_SIZE]);
    80001554:	00008537          	lui	a0,0x8
    80001558:	00001097          	auipc	ra,0x1
    8000155c:	92c080e7          	jalr	-1748(ra) # 80001e84 <_Znam>
    80001560:	00050713          	mv	a4,a0
    syscall(THREAD_CREATE_CODE, handle, start_routine, arg, stack);
    80001564:	00098693          	mv	a3,s3
    80001568:	00090613          	mv	a2,s2
    8000156c:	00048593          	mv	a1,s1
    80001570:	01100513          	li	a0,17
    80001574:	00000097          	auipc	ra,0x0
    80001578:	f10080e7          	jalr	-240(ra) # 80001484 <_Z7syscalliz>

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    8000157c:	00050513          	mv	a0,a0
    return ret;
}
    80001580:	0005051b          	sext.w	a0,a0
    80001584:	02813083          	ld	ra,40(sp)
    80001588:	02013403          	ld	s0,32(sp)
    8000158c:	01813483          	ld	s1,24(sp)
    80001590:	01013903          	ld	s2,16(sp)
    80001594:	00813983          	ld	s3,8(sp)
    80001598:	03010113          	addi	sp,sp,48
    8000159c:	00008067          	ret

00000000800015a0 <_Z11thread_exitv>:



int thread_exit() {
    800015a0:	ff010113          	addi	sp,sp,-16
    800015a4:	00113423          	sd	ra,8(sp)
    800015a8:	00813023          	sd	s0,0(sp)
    800015ac:	01010413          	addi	s0,sp,16
    syscall(THREAD_EXIT_CODE);
    800015b0:	01200513          	li	a0,18
    800015b4:	00000097          	auipc	ra,0x0
    800015b8:	ed0080e7          	jalr	-304(ra) # 80001484 <_Z7syscalliz>

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    800015bc:	00050513          	mv	a0,a0
    return ret;
}
    800015c0:	0005051b          	sext.w	a0,a0
    800015c4:	00813083          	ld	ra,8(sp)
    800015c8:	00013403          	ld	s0,0(sp)
    800015cc:	01010113          	addi	sp,sp,16
    800015d0:	00008067          	ret

00000000800015d4 <_Z15thread_dispatchv>:

void thread_dispatch() {
    800015d4:	ff010113          	addi	sp,sp,-16
    800015d8:	00113423          	sd	ra,8(sp)
    800015dc:	00813023          	sd	s0,0(sp)
    800015e0:	01010413          	addi	s0,sp,16
    syscall(THREAD_DISPATCH_CODE);
    800015e4:	01300513          	li	a0,19
    800015e8:	00000097          	auipc	ra,0x0
    800015ec:	e9c080e7          	jalr	-356(ra) # 80001484 <_Z7syscalliz>
}
    800015f0:	00813083          	ld	ra,8(sp)
    800015f4:	00013403          	ld	s0,0(sp)
    800015f8:	01010113          	addi	sp,sp,16
    800015fc:	00008067          	ret

0000000080001600 <_Z11thread_joinP3TCB>:

void thread_join(TCB *handle) {
    80001600:	ff010113          	addi	sp,sp,-16
    80001604:	00113423          	sd	ra,8(sp)
    80001608:	00813023          	sd	s0,0(sp)
    8000160c:	01010413          	addi	s0,sp,16
    80001610:	00050593          	mv	a1,a0
    syscall(THREAD_JOIN_CODE, handle);
    80001614:	01400513          	li	a0,20
    80001618:	00000097          	auipc	ra,0x0
    8000161c:	e6c080e7          	jalr	-404(ra) # 80001484 <_Z7syscalliz>
}
    80001620:	00813083          	ld	ra,8(sp)
    80001624:	00013403          	ld	s0,0(sp)
    80001628:	01010113          	addi	sp,sp,16
    8000162c:	00008067          	ret

0000000080001630 <_Z8sem_openPP3Semj>:

int sem_open (Sem **handle, unsigned init) {
    80001630:	ff010113          	addi	sp,sp,-16
    80001634:	00113423          	sd	ra,8(sp)
    80001638:	00813023          	sd	s0,0(sp)
    8000163c:	01010413          	addi	s0,sp,16
    80001640:	00058613          	mv	a2,a1
    syscall(SEM_OPEN_CODE, handle, init);
    80001644:	00050593          	mv	a1,a0
    80001648:	02100513          	li	a0,33
    8000164c:	00000097          	auipc	ra,0x0
    80001650:	e38080e7          	jalr	-456(ra) # 80001484 <_Z7syscalliz>

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    80001654:	00050513          	mv	a0,a0
    return ret;
}
    80001658:	0005051b          	sext.w	a0,a0
    8000165c:	00813083          	ld	ra,8(sp)
    80001660:	00013403          	ld	s0,0(sp)
    80001664:	01010113          	addi	sp,sp,16
    80001668:	00008067          	ret

000000008000166c <_Z9sem_closeP3Sem>:

int sem_close (Sem *handle) {
    8000166c:	ff010113          	addi	sp,sp,-16
    80001670:	00113423          	sd	ra,8(sp)
    80001674:	00813023          	sd	s0,0(sp)
    80001678:	01010413          	addi	s0,sp,16
    8000167c:	00050593          	mv	a1,a0
    syscall(SEM_CLOSE_CODE, handle);
    80001680:	02200513          	li	a0,34
    80001684:	00000097          	auipc	ra,0x0
    80001688:	e00080e7          	jalr	-512(ra) # 80001484 <_Z7syscalliz>

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    8000168c:	00050513          	mv	a0,a0
    return ret;
}
    80001690:	0005051b          	sext.w	a0,a0
    80001694:	00813083          	ld	ra,8(sp)
    80001698:	00013403          	ld	s0,0(sp)
    8000169c:	01010113          	addi	sp,sp,16
    800016a0:	00008067          	ret

00000000800016a4 <_Z8sem_waitP3Sem>:

int sem_wait (Sem *id) {
    800016a4:	ff010113          	addi	sp,sp,-16
    800016a8:	00113423          	sd	ra,8(sp)
    800016ac:	00813023          	sd	s0,0(sp)
    800016b0:	01010413          	addi	s0,sp,16
    800016b4:	00050593          	mv	a1,a0
    syscall(SEM_WAIT_CODE, id);
    800016b8:	02300513          	li	a0,35
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	dc8080e7          	jalr	-568(ra) # 80001484 <_Z7syscalliz>

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    800016c4:	00050513          	mv	a0,a0
    return ret;
}
    800016c8:	0005051b          	sext.w	a0,a0
    800016cc:	00813083          	ld	ra,8(sp)
    800016d0:	00013403          	ld	s0,0(sp)
    800016d4:	01010113          	addi	sp,sp,16
    800016d8:	00008067          	ret

00000000800016dc <_Z10sem_signalP3Sem>:

int sem_signal (Sem *id) {
    800016dc:	ff010113          	addi	sp,sp,-16
    800016e0:	00113423          	sd	ra,8(sp)
    800016e4:	00813023          	sd	s0,0(sp)
    800016e8:	01010413          	addi	s0,sp,16
    800016ec:	00050593          	mv	a1,a0
    syscall(SEM_SIGNAL_CODE, id);
    800016f0:	02400513          	li	a0,36
    800016f4:	00000097          	auipc	ra,0x0
    800016f8:	d90080e7          	jalr	-624(ra) # 80001484 <_Z7syscalliz>

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    800016fc:	00050513          	mv	a0,a0
    return ret;
}
    80001700:	0005051b          	sext.w	a0,a0
    80001704:	00813083          	ld	ra,8(sp)
    80001708:	00013403          	ld	s0,0(sp)
    8000170c:	01010113          	addi	sp,sp,16
    80001710:	00008067          	ret

0000000080001714 <_Z10time_sleepm>:


int time_sleep(time_t time) {
    80001714:	ff010113          	addi	sp,sp,-16
    80001718:	00113423          	sd	ra,8(sp)
    8000171c:	00813023          	sd	s0,0(sp)
    80001720:	01010413          	addi	s0,sp,16
    80001724:	00050593          	mv	a1,a0
    syscall(SLEEP_CODE, time);
    80001728:	03100513          	li	a0,49
    8000172c:	00000097          	auipc	ra,0x0
    80001730:	d58080e7          	jalr	-680(ra) # 80001484 <_Z7syscalliz>

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    80001734:	00050513          	mv	a0,a0
    return ret;
}
    80001738:	0005051b          	sext.w	a0,a0
    8000173c:	00813083          	ld	ra,8(sp)
    80001740:	00013403          	ld	s0,0(sp)
    80001744:	01010113          	addi	sp,sp,16
    80001748:	00008067          	ret

000000008000174c <_Z4getcv>:

char getc() {
    8000174c:	ff010113          	addi	sp,sp,-16
    80001750:	00113423          	sd	ra,8(sp)
    80001754:	00813023          	sd	s0,0(sp)
    80001758:	01010413          	addi	s0,sp,16
    syscall(CONSOLE_GETC_CODE);
    8000175c:	04100513          	li	a0,65
    80001760:	00000097          	auipc	ra,0x0
    80001764:	d24080e7          	jalr	-732(ra) # 80001484 <_Z7syscalliz>

    char ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    80001768:	00050513          	mv	a0,a0
    return ret;
}
    8000176c:	0ff57513          	andi	a0,a0,255
    80001770:	00813083          	ld	ra,8(sp)
    80001774:	00013403          	ld	s0,0(sp)
    80001778:	01010113          	addi	sp,sp,16
    8000177c:	00008067          	ret

0000000080001780 <_Z4putcc>:

void putc(char c) {
    80001780:	ff010113          	addi	sp,sp,-16
    80001784:	00113423          	sd	ra,8(sp)
    80001788:	00813023          	sd	s0,0(sp)
    8000178c:	01010413          	addi	s0,sp,16
    80001790:	00050593          	mv	a1,a0
    syscall(CONSOLE_PUTC_CODE, c);
    80001794:	04200513          	li	a0,66
    80001798:	00000097          	auipc	ra,0x0
    8000179c:	cec080e7          	jalr	-788(ra) # 80001484 <_Z7syscalliz>
}
    800017a0:	00813083          	ld	ra,8(sp)
    800017a4:	00013403          	ld	s0,0(sp)
    800017a8:	01010113          	addi	sp,sp,16
    800017ac:	00008067          	ret

00000000800017b0 <_ZN3Sem7semOpenEPPS_j>:
#include "../h/Sem.hpp"
#include "../h/syscall_c.hpp"

int Sem::semOpen(Sem **handle, unsigned int init) {
    800017b0:	fd010113          	addi	sp,sp,-48
    800017b4:	02113423          	sd	ra,40(sp)
    800017b8:	02813023          	sd	s0,32(sp)
    800017bc:	00913c23          	sd	s1,24(sp)
    800017c0:	01213823          	sd	s2,16(sp)
    800017c4:	01313423          	sd	s3,8(sp)
    800017c8:	03010413          	addi	s0,sp,48
    800017cc:	00050913          	mv	s2,a0
    800017d0:	00058993          	mv	s3,a1
    *handle = new Sem((int) init);
    800017d4:	01000513          	li	a0,16
    800017d8:	00000097          	auipc	ra,0x0
    800017dc:	684080e7          	jalr	1668(ra) # 80001e5c <_Znwm>
    800017e0:	00050493          	mv	s1,a0
    Blocked *blockedThreads = new Blocked();

public:
    friend class TCB;

    Sem(int i) : init(i) { }
    800017e4:	01352023          	sw	s3,0(a0) # 8000 <_entry-0x7fff8000>
    800017e8:	01000513          	li	a0,16
    800017ec:	00000097          	auipc	ra,0x0
    800017f0:	670080e7          	jalr	1648(ra) # 80001e5c <_Znwm>
    800017f4:	00053023          	sd	zero,0(a0)
    800017f8:	00053423          	sd	zero,8(a0)
    800017fc:	00a4b423          	sd	a0,8(s1)
    80001800:	00993023          	sd	s1,0(s2)
    if(!*handle) return -1;
    80001804:	02048263          	beqz	s1,80001828 <_ZN3Sem7semOpenEPPS_j+0x78>
    return 0;
    80001808:	00000513          	li	a0,0
}
    8000180c:	02813083          	ld	ra,40(sp)
    80001810:	02013403          	ld	s0,32(sp)
    80001814:	01813483          	ld	s1,24(sp)
    80001818:	01013903          	ld	s2,16(sp)
    8000181c:	00813983          	ld	s3,8(sp)
    80001820:	03010113          	addi	sp,sp,48
    80001824:	00008067          	ret
    if(!*handle) return -1;
    80001828:	fff00513          	li	a0,-1
    8000182c:	fe1ff06f          	j	8000180c <_ZN3Sem7semOpenEPPS_j+0x5c>
    80001830:	00050913          	mv	s2,a0
    *handle = new Sem((int) init);
    80001834:	00048513          	mv	a0,s1
    80001838:	00000097          	auipc	ra,0x0
    8000183c:	674080e7          	jalr	1652(ra) # 80001eac <_ZdlPv>
    80001840:	00090513          	mv	a0,s2
    80001844:	0000c097          	auipc	ra,0xc
    80001848:	9a4080e7          	jalr	-1628(ra) # 8000d1e8 <_Unwind_Resume>

000000008000184c <_ZN3Sem5blockEv>:
    if(!id) return -1;
    if(++id->init <= 0) id->deblock();
    return 0;
}

void Sem::block() {
    8000184c:	ff010113          	addi	sp,sp,-16
    80001850:	00113423          	sd	ra,8(sp)
    80001854:	00813023          	sd	s0,0(sp)
    80001858:	01010413          	addi	s0,sp,16
    TCB::running->setBlocked(true);
    8000185c:	0000a797          	auipc	a5,0xa
    80001860:	f9c7b783          	ld	a5,-100(a5) # 8000b7f8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001864:	0007b583          	ld	a1,0(a5)
    bool isFinished() const { return finished; }
    void setFinished(bool f) { finished = f; }
    bool isJoined() const { return joined; }
    void setJoined(bool b) { joined = b; }
    bool isBlocked() const { return blocked; }
    void setBlocked(bool b) { blocked = b; }
    80001868:	00100793          	li	a5,1
    8000186c:	02f58523          	sb	a5,42(a1)
    blockedThreads->put(TCB::running);
    80001870:	00853503          	ld	a0,8(a0)
    80001874:	00000097          	auipc	ra,0x0
    80001878:	4bc080e7          	jalr	1212(ra) # 80001d30 <_ZN7Blocked3putEP3TCB>
    TCB::yield();
    8000187c:	00001097          	auipc	ra,0x1
    80001880:	d80080e7          	jalr	-640(ra) # 800025fc <_ZN3TCB5yieldEv>
}
    80001884:	00813083          	ld	ra,8(sp)
    80001888:	00013403          	ld	s0,0(sp)
    8000188c:	01010113          	addi	sp,sp,16
    80001890:	00008067          	ret

0000000080001894 <_ZN3Sem7semWaitEPS_>:
    if(!id) return -1;
    80001894:	04050663          	beqz	a0,800018e0 <_ZN3Sem7semWaitEPS_+0x4c>
    if(--id->init < 0) id->block();
    80001898:	00052783          	lw	a5,0(a0)
    8000189c:	fff7879b          	addiw	a5,a5,-1
    800018a0:	00f52023          	sw	a5,0(a0)
    800018a4:	02079713          	slli	a4,a5,0x20
    800018a8:	00074663          	bltz	a4,800018b4 <_ZN3Sem7semWaitEPS_+0x20>
    return 0;
    800018ac:	00000513          	li	a0,0
}
    800018b0:	00008067          	ret
int Sem::semWait(Sem *id) {
    800018b4:	ff010113          	addi	sp,sp,-16
    800018b8:	00113423          	sd	ra,8(sp)
    800018bc:	00813023          	sd	s0,0(sp)
    800018c0:	01010413          	addi	s0,sp,16
    if(--id->init < 0) id->block();
    800018c4:	00000097          	auipc	ra,0x0
    800018c8:	f88080e7          	jalr	-120(ra) # 8000184c <_ZN3Sem5blockEv>
    return 0;
    800018cc:	00000513          	li	a0,0
}
    800018d0:	00813083          	ld	ra,8(sp)
    800018d4:	00013403          	ld	s0,0(sp)
    800018d8:	01010113          	addi	sp,sp,16
    800018dc:	00008067          	ret
    if(!id) return -1;
    800018e0:	fff00513          	li	a0,-1
    800018e4:	00008067          	ret

00000000800018e8 <_ZN3Sem7deblockEv>:

void Sem::deblock() {
    800018e8:	ff010113          	addi	sp,sp,-16
    800018ec:	00113423          	sd	ra,8(sp)
    800018f0:	00813023          	sd	s0,0(sp)
    800018f4:	01010413          	addi	s0,sp,16
    TCB *p = blockedThreads->get();
    800018f8:	00853503          	ld	a0,8(a0)
    800018fc:	00000097          	auipc	ra,0x0
    80001900:	3d4080e7          	jalr	980(ra) # 80001cd0 <_ZN7Blocked3getEv>
    80001904:	02050523          	sb	zero,42(a0)
    p->setBlocked(false);
    Scheduler::put(p);
    80001908:	00000097          	auipc	ra,0x0
    8000190c:	138080e7          	jalr	312(ra) # 80001a40 <_ZN9Scheduler3putEP3TCB>
}
    80001910:	00813083          	ld	ra,8(sp)
    80001914:	00013403          	ld	s0,0(sp)
    80001918:	01010113          	addi	sp,sp,16
    8000191c:	00008067          	ret

0000000080001920 <_ZN3Sem8semCloseEPS_>:
int Sem::semClose(Sem *handle) {
    80001920:	fe010113          	addi	sp,sp,-32
    80001924:	00113c23          	sd	ra,24(sp)
    80001928:	00813823          	sd	s0,16(sp)
    8000192c:	00913423          	sd	s1,8(sp)
    80001930:	02010413          	addi	s0,sp,32
    80001934:	00050493          	mv	s1,a0
    if(!handle) return -1;
    80001938:	04050263          	beqz	a0,8000197c <_ZN3Sem8semCloseEPS_+0x5c>
    while(handle->blockedThreads->head) handle->deblock();
    8000193c:	0084b783          	ld	a5,8(s1)
    80001940:	0007b783          	ld	a5,0(a5)
    80001944:	00078a63          	beqz	a5,80001958 <_ZN3Sem8semCloseEPS_+0x38>
    80001948:	00048513          	mv	a0,s1
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	f9c080e7          	jalr	-100(ra) # 800018e8 <_ZN3Sem7deblockEv>
    80001954:	fe9ff06f          	j	8000193c <_ZN3Sem8semCloseEPS_+0x1c>
    delete handle;
    80001958:	00048513          	mv	a0,s1
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	550080e7          	jalr	1360(ra) # 80001eac <_ZdlPv>
    return 0;
    80001964:	00000513          	li	a0,0
}
    80001968:	01813083          	ld	ra,24(sp)
    8000196c:	01013403          	ld	s0,16(sp)
    80001970:	00813483          	ld	s1,8(sp)
    80001974:	02010113          	addi	sp,sp,32
    80001978:	00008067          	ret
    if(!handle) return -1;
    8000197c:	fff00513          	li	a0,-1
    80001980:	fe9ff06f          	j	80001968 <_ZN3Sem8semCloseEPS_+0x48>

0000000080001984 <_ZN3Sem9semSignalEPS_>:
    if(!id) return -1;
    80001984:	04050663          	beqz	a0,800019d0 <_ZN3Sem9semSignalEPS_+0x4c>
    if(++id->init <= 0) id->deblock();
    80001988:	00052783          	lw	a5,0(a0)
    8000198c:	0017879b          	addiw	a5,a5,1
    80001990:	0007871b          	sext.w	a4,a5
    80001994:	00f52023          	sw	a5,0(a0)
    80001998:	00e05663          	blez	a4,800019a4 <_ZN3Sem9semSignalEPS_+0x20>
    return 0;
    8000199c:	00000513          	li	a0,0
}
    800019a0:	00008067          	ret
int Sem::semSignal(Sem *id) {
    800019a4:	ff010113          	addi	sp,sp,-16
    800019a8:	00113423          	sd	ra,8(sp)
    800019ac:	00813023          	sd	s0,0(sp)
    800019b0:	01010413          	addi	s0,sp,16
    if(++id->init <= 0) id->deblock();
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	f34080e7          	jalr	-204(ra) # 800018e8 <_ZN3Sem7deblockEv>
    return 0;
    800019bc:	00000513          	li	a0,0
}
    800019c0:	00813083          	ld	ra,8(sp)
    800019c4:	00013403          	ld	s0,0(sp)
    800019c8:	01010113          	addi	sp,sp,16
    800019cc:	00008067          	ret
    if(!id) return -1;
    800019d0:	fff00513          	li	a0,-1
    800019d4:	00008067          	ret

00000000800019d8 <_ZN9Scheduler3getEv>:
#include "../h/Scheduler.hpp"

Scheduler::Elem* Scheduler::head = nullptr;
Scheduler::Elem* Scheduler::tail = nullptr;

TCB *Scheduler::get() {
    800019d8:	fe010113          	addi	sp,sp,-32
    800019dc:	00113c23          	sd	ra,24(sp)
    800019e0:	00813823          	sd	s0,16(sp)
    800019e4:	00913423          	sd	s1,8(sp)
    800019e8:	02010413          	addi	s0,sp,32
    if(!head) return nullptr;
    800019ec:	0000a517          	auipc	a0,0xa
    800019f0:	e6453503          	ld	a0,-412(a0) # 8000b850 <_ZN9Scheduler4headE>
    800019f4:	04050263          	beqz	a0,80001a38 <_ZN9Scheduler3getEv+0x60>
    Elem *elem = head;
    TCB *ret = elem->thread;
    800019f8:	00053483          	ld	s1,0(a0)
    head = head->next;
    800019fc:	00853783          	ld	a5,8(a0)
    80001a00:	0000a717          	auipc	a4,0xa
    80001a04:	e4f73823          	sd	a5,-432(a4) # 8000b850 <_ZN9Scheduler4headE>
    if(!head) tail = nullptr;
    80001a08:	02078263          	beqz	a5,80001a2c <_ZN9Scheduler3getEv+0x54>
    delete elem;
    80001a0c:	00000097          	auipc	ra,0x0
    80001a10:	4a0080e7          	jalr	1184(ra) # 80001eac <_ZdlPv>
    return ret;
}
    80001a14:	00048513          	mv	a0,s1
    80001a18:	01813083          	ld	ra,24(sp)
    80001a1c:	01013403          	ld	s0,16(sp)
    80001a20:	00813483          	ld	s1,8(sp)
    80001a24:	02010113          	addi	sp,sp,32
    80001a28:	00008067          	ret
    if(!head) tail = nullptr;
    80001a2c:	0000a797          	auipc	a5,0xa
    80001a30:	e207b623          	sd	zero,-468(a5) # 8000b858 <_ZN9Scheduler4tailE>
    80001a34:	fd9ff06f          	j	80001a0c <_ZN9Scheduler3getEv+0x34>
    if(!head) return nullptr;
    80001a38:	00050493          	mv	s1,a0
    80001a3c:	fd9ff06f          	j	80001a14 <_ZN9Scheduler3getEv+0x3c>

0000000080001a40 <_ZN9Scheduler3putEP3TCB>:

void Scheduler::put(TCB *t) {
    80001a40:	fe010113          	addi	sp,sp,-32
    80001a44:	00113c23          	sd	ra,24(sp)
    80001a48:	00813823          	sd	s0,16(sp)
    80001a4c:	00913423          	sd	s1,8(sp)
    80001a50:	02010413          	addi	s0,sp,32
    80001a54:	00050493          	mv	s1,a0
    Elem *newElem = new Elem(t, nullptr);
    80001a58:	01000513          	li	a0,16
    80001a5c:	00000097          	auipc	ra,0x0
    80001a60:	400080e7          	jalr	1024(ra) # 80001e5c <_Znwm>

class Scheduler {
    struct Elem {
        TCB *thread;
        Elem *next = nullptr;
        Elem(TCB *p, Elem *n) : thread(p), next(n) {}
    80001a64:	00953023          	sd	s1,0(a0)
    80001a68:	00053423          	sd	zero,8(a0)
    if(!head) { head = tail = newElem; }
    80001a6c:	0000a797          	auipc	a5,0xa
    80001a70:	de47b783          	ld	a5,-540(a5) # 8000b850 <_ZN9Scheduler4headE>
    80001a74:	02078663          	beqz	a5,80001aa0 <_ZN9Scheduler3putEP3TCB+0x60>
    else {
        tail->next = newElem;
    80001a78:	0000a797          	auipc	a5,0xa
    80001a7c:	dd878793          	addi	a5,a5,-552 # 8000b850 <_ZN9Scheduler4headE>
    80001a80:	0087b703          	ld	a4,8(a5)
    80001a84:	00a73423          	sd	a0,8(a4)
        tail = tail->next;
    80001a88:	00a7b423          	sd	a0,8(a5)
    }
    80001a8c:	01813083          	ld	ra,24(sp)
    80001a90:	01013403          	ld	s0,16(sp)
    80001a94:	00813483          	ld	s1,8(sp)
    80001a98:	02010113          	addi	sp,sp,32
    80001a9c:	00008067          	ret
    if(!head) { head = tail = newElem; }
    80001aa0:	0000a797          	auipc	a5,0xa
    80001aa4:	db078793          	addi	a5,a5,-592 # 8000b850 <_ZN9Scheduler4headE>
    80001aa8:	00a7b423          	sd	a0,8(a5)
    80001aac:	00a7b023          	sd	a0,0(a5)
    80001ab0:	fddff06f          	j	80001a8c <_ZN9Scheduler3putEP3TCB+0x4c>

0000000080001ab4 <_Z6outputPv>:
extern "C" void interruptTable();
extern void userMain();

void output(void *p) {
    while(true) {
        while(CONSOLE_TX_STATUS_BIT & *((char*)(CONSOLE_STATUS))) {
    80001ab4:	0000a797          	auipc	a5,0xa
    80001ab8:	d147b783          	ld	a5,-748(a5) # 8000b7c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001abc:	0007b783          	ld	a5,0(a5)
    80001ac0:	0007c783          	lbu	a5,0(a5)
    80001ac4:	0207f793          	andi	a5,a5,32
    80001ac8:	fe0786e3          	beqz	a5,80001ab4 <_Z6outputPv>
void output(void *p) {
    80001acc:	ff010113          	addi	sp,sp,-16
    80001ad0:	00113423          	sd	ra,8(sp)
    80001ad4:	00813023          	sd	s0,0(sp)
    80001ad8:	01010413          	addi	s0,sp,16
            char c = Cons::getcO();
    80001adc:	00001097          	auipc	ra,0x1
    80001ae0:	3a0080e7          	jalr	928(ra) # 80002e7c <_ZN4Cons5getcOEv>
            *((char*) CONSOLE_TX_DATA) = c;
    80001ae4:	0000a797          	auipc	a5,0xa
    80001ae8:	d047b783          	ld	a5,-764(a5) # 8000b7e8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001aec:	0007b783          	ld	a5,0(a5)
    80001af0:	00a78023          	sb	a0,0(a5)
        while(CONSOLE_TX_STATUS_BIT & *((char*)(CONSOLE_STATUS))) {
    80001af4:	0000a797          	auipc	a5,0xa
    80001af8:	cd47b783          	ld	a5,-812(a5) # 8000b7c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001afc:	0007b783          	ld	a5,0(a5)
    80001b00:	0007c783          	lbu	a5,0(a5)
    80001b04:	0207f793          	andi	a5,a5,32
    80001b08:	fe0786e3          	beqz	a5,80001af4 <_Z6outputPv+0x40>
    80001b0c:	fd1ff06f          	j	80001adc <_Z6outputPv+0x28>

0000000080001b10 <_Z4idlePv>:
        }
    }
}

void idle(void *p) {
    80001b10:	ff010113          	addi	sp,sp,-16
    80001b14:	00113423          	sd	ra,8(sp)
    80001b18:	00813023          	sd	s0,0(sp)
    80001b1c:	01010413          	addi	s0,sp,16
    while(true){ thread_dispatch(); }
    80001b20:	00000097          	auipc	ra,0x0
    80001b24:	ab4080e7          	jalr	-1356(ra) # 800015d4 <_Z15thread_dispatchv>
    80001b28:	ff9ff06f          	j	80001b20 <_Z4idlePv+0x10>

0000000080001b2c <_Z15userMainWrapperPv>:
}

bool mainFinished = false;

void userMainWrapper(void *p) {
    80001b2c:	ff010113          	addi	sp,sp,-16
    80001b30:	00113423          	sd	ra,8(sp)
    80001b34:	00813023          	sd	s0,0(sp)
    80001b38:	01010413          	addi	s0,sp,16
    userMain();
    80001b3c:	00004097          	auipc	ra,0x4
    80001b40:	324080e7          	jalr	804(ra) # 80005e60 <_Z8userMainv>
    mainFinished = true;
    80001b44:	00100793          	li	a5,1
    80001b48:	0000a717          	auipc	a4,0xa
    80001b4c:	d0f70c23          	sb	a5,-744(a4) # 8000b860 <mainFinished>
}
    80001b50:	00813083          	ld	ra,8(sp)
    80001b54:	00013403          	ld	s0,0(sp)
    80001b58:	01010113          	addi	sp,sp,16
    80001b5c:	00008067          	ret

0000000080001b60 <main>:

void main() {
    80001b60:	fc010113          	addi	sp,sp,-64
    80001b64:	02113c23          	sd	ra,56(sp)
    80001b68:	02813823          	sd	s0,48(sp)
    80001b6c:	02913423          	sd	s1,40(sp)
    80001b70:	04010413          	addi	s0,sp,64
    __asm__ volatile ("csrw stvec, %0" : : "r" ((uint64)&interruptTable + 1));
    80001b74:	0000a797          	auipc	a5,0xa
    80001b78:	c947b783          	ld	a5,-876(a5) # 8000b808 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001b7c:	00178793          	addi	a5,a5,1
    80001b80:	10579073          	csrw	stvec,a5

    TCB *mainHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    80001b84:	00000613          	li	a2,0
    80001b88:	00000593          	li	a1,0
    80001b8c:	fd840513          	addi	a0,s0,-40
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	99c080e7          	jalr	-1636(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = mainHandle;
    80001b98:	0000a797          	auipc	a5,0xa
    80001b9c:	c607b783          	ld	a5,-928(a5) # 8000b7f8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001ba0:	fd843703          	ld	a4,-40(s0)
    80001ba4:	00e7b023          	sd	a4,0(a5)
    TCB *idleHandle;
    thread_create(&idleHandle, idle, nullptr);
    80001ba8:	00000613          	li	a2,0
    80001bac:	00000597          	auipc	a1,0x0
    80001bb0:	f6458593          	addi	a1,a1,-156 # 80001b10 <_Z4idlePv>
    80001bb4:	fd040513          	addi	a0,s0,-48
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	974080e7          	jalr	-1676(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    TCB *outputHandle;
    thread_create(&outputHandle, output, nullptr);
    80001bc0:	00000613          	li	a2,0
    80001bc4:	00000597          	auipc	a1,0x0
    80001bc8:	ef058593          	addi	a1,a1,-272 # 80001ab4 <_Z6outputPv>
    80001bcc:	fc840513          	addi	a0,s0,-56
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	95c080e7          	jalr	-1700(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>

    TCB::userMode = true;
    80001bd8:	0000a797          	auipc	a5,0xa
    80001bdc:	c007b783          	ld	a5,-1024(a5) # 8000b7d8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001be0:	00100713          	li	a4,1
    80001be4:	00e78023          	sb	a4,0(a5)
    TCB *userMainHandle;
    thread_create(&userMainHandle, userMainWrapper, nullptr);
    80001be8:	00000613          	li	a2,0
    80001bec:	00000597          	auipc	a1,0x0
    80001bf0:	f4058593          	addi	a1,a1,-192 # 80001b2c <_Z15userMainWrapperPv>
    80001bf4:	fc040513          	addi	a0,s0,-64
    80001bf8:	00000097          	auipc	ra,0x0
    80001bfc:	934080e7          	jalr	-1740(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>

    int maskSSTATUS_SIE = 1 << 1;
    __asm__ volatile ("csrs sstatus, %0" : : "r"(maskSSTATUS_SIE));
    80001c00:	00200793          	li	a5,2
    80001c04:	1007a073          	csrs	sstatus,a5
    while(!mainFinished) {
    80001c08:	0000a797          	auipc	a5,0xa
    80001c0c:	c587c783          	lbu	a5,-936(a5) # 8000b860 <mainFinished>
    80001c10:	00079863          	bnez	a5,80001c20 <main+0xc0>
        thread_dispatch();
    80001c14:	00000097          	auipc	ra,0x0
    80001c18:	9c0080e7          	jalr	-1600(ra) # 800015d4 <_Z15thread_dispatchv>
    80001c1c:	fedff06f          	j	80001c08 <main+0xa8>
    }
    TCB::userMode = false;
    80001c20:	0000a797          	auipc	a5,0xa
    80001c24:	bb87b783          	ld	a5,-1096(a5) # 8000b7d8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001c28:	00078023          	sb	zero,0(a5)

    Cons::dest();
    80001c2c:	00001097          	auipc	ra,0x1
    80001c30:	088080e7          	jalr	136(ra) # 80002cb4 <_ZN4Cons4destEv>
    thread_dispatch();
    80001c34:	00000097          	auipc	ra,0x0
    80001c38:	9a0080e7          	jalr	-1632(ra) # 800015d4 <_Z15thread_dispatchv>
    delete idleHandle;
    80001c3c:	fd043483          	ld	s1,-48(s0)
    80001c40:	00048e63          	beqz	s1,80001c5c <main+0xfc>
    80001c44:	00048513          	mv	a0,s1
    80001c48:	00001097          	auipc	ra,0x1
    80001c4c:	ae0080e7          	jalr	-1312(ra) # 80002728 <_ZN3TCBD1Ev>
    80001c50:	00048513          	mv	a0,s1
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	258080e7          	jalr	600(ra) # 80001eac <_ZdlPv>
    delete userMainHandle;
    80001c5c:	fc043483          	ld	s1,-64(s0)
    80001c60:	00048e63          	beqz	s1,80001c7c <main+0x11c>
    80001c64:	00048513          	mv	a0,s1
    80001c68:	00001097          	auipc	ra,0x1
    80001c6c:	ac0080e7          	jalr	-1344(ra) # 80002728 <_ZN3TCBD1Ev>
    80001c70:	00048513          	mv	a0,s1
    80001c74:	00000097          	auipc	ra,0x0
    80001c78:	238080e7          	jalr	568(ra) # 80001eac <_ZdlPv>
    delete outputHandle;
    80001c7c:	fc843483          	ld	s1,-56(s0)
    80001c80:	00048e63          	beqz	s1,80001c9c <main+0x13c>
    80001c84:	00048513          	mv	a0,s1
    80001c88:	00001097          	auipc	ra,0x1
    80001c8c:	aa0080e7          	jalr	-1376(ra) # 80002728 <_ZN3TCBD1Ev>
    80001c90:	00048513          	mv	a0,s1
    80001c94:	00000097          	auipc	ra,0x0
    80001c98:	218080e7          	jalr	536(ra) # 80001eac <_ZdlPv>
    delete mainHandle;
    80001c9c:	fd843483          	ld	s1,-40(s0)
    80001ca0:	00048e63          	beqz	s1,80001cbc <main+0x15c>
    80001ca4:	00048513          	mv	a0,s1
    80001ca8:	00001097          	auipc	ra,0x1
    80001cac:	a80080e7          	jalr	-1408(ra) # 80002728 <_ZN3TCBD1Ev>
    80001cb0:	00048513          	mv	a0,s1
    80001cb4:	00000097          	auipc	ra,0x0
    80001cb8:	1f8080e7          	jalr	504(ra) # 80001eac <_ZdlPv>
    80001cbc:	03813083          	ld	ra,56(sp)
    80001cc0:	03013403          	ld	s0,48(sp)
    80001cc4:	02813483          	ld	s1,40(sp)
    80001cc8:	04010113          	addi	sp,sp,64
    80001ccc:	00008067          	ret

0000000080001cd0 <_ZN7Blocked3getEv>:
#include "../h/Blocked.hpp"

TCB *Blocked::get() {
    80001cd0:	fe010113          	addi	sp,sp,-32
    80001cd4:	00113c23          	sd	ra,24(sp)
    80001cd8:	00813823          	sd	s0,16(sp)
    80001cdc:	00913423          	sd	s1,8(sp)
    80001ce0:	02010413          	addi	s0,sp,32
    80001ce4:	00050793          	mv	a5,a0
    if(!head) return nullptr;
    80001ce8:	00053503          	ld	a0,0(a0)
    80001cec:	02050e63          	beqz	a0,80001d28 <_ZN7Blocked3getEv+0x58>
    Elem *elem = head;
    TCB *ret = elem->thread;
    80001cf0:	00053483          	ld	s1,0(a0)
    head = head->next;
    80001cf4:	00853703          	ld	a4,8(a0)
    80001cf8:	00e7b023          	sd	a4,0(a5)
    if(!head) tail = nullptr;
    80001cfc:	02070263          	beqz	a4,80001d20 <_ZN7Blocked3getEv+0x50>
    delete elem;
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	1ac080e7          	jalr	428(ra) # 80001eac <_ZdlPv>
    return ret;
}
    80001d08:	00048513          	mv	a0,s1
    80001d0c:	01813083          	ld	ra,24(sp)
    80001d10:	01013403          	ld	s0,16(sp)
    80001d14:	00813483          	ld	s1,8(sp)
    80001d18:	02010113          	addi	sp,sp,32
    80001d1c:	00008067          	ret
    if(!head) tail = nullptr;
    80001d20:	0007b423          	sd	zero,8(a5)
    80001d24:	fddff06f          	j	80001d00 <_ZN7Blocked3getEv+0x30>
    if(!head) return nullptr;
    80001d28:	00050493          	mv	s1,a0
    80001d2c:	fddff06f          	j	80001d08 <_ZN7Blocked3getEv+0x38>

0000000080001d30 <_ZN7Blocked3putEP3TCB>:

void Blocked::put(TCB *t) {
    80001d30:	fe010113          	addi	sp,sp,-32
    80001d34:	00113c23          	sd	ra,24(sp)
    80001d38:	00813823          	sd	s0,16(sp)
    80001d3c:	00913423          	sd	s1,8(sp)
    80001d40:	01213023          	sd	s2,0(sp)
    80001d44:	02010413          	addi	s0,sp,32
    80001d48:	00050493          	mv	s1,a0
    80001d4c:	00058913          	mv	s2,a1
    Elem *newElem = new Elem(t, nullptr);
    80001d50:	01000513          	li	a0,16
    80001d54:	00000097          	auipc	ra,0x0
    80001d58:	108080e7          	jalr	264(ra) # 80001e5c <_Znwm>
class Blocked {
public:
    struct Elem {
        TCB *thread;
        Elem *next = nullptr;
        Elem(TCB *t, Elem *n) : thread(t), next(n) {}
    80001d5c:	01253023          	sd	s2,0(a0)
    80001d60:	00053423          	sd	zero,8(a0)
    if(!head) { head = tail = newElem; }
    80001d64:	0004b783          	ld	a5,0(s1)
    80001d68:	02078863          	beqz	a5,80001d98 <_ZN7Blocked3putEP3TCB+0x68>
    else {
        tail->next = newElem;
    80001d6c:	0084b783          	ld	a5,8(s1)
    80001d70:	00a7b423          	sd	a0,8(a5)
        tail = tail->next;
    80001d74:	0084b783          	ld	a5,8(s1)
    80001d78:	0087b783          	ld	a5,8(a5)
    80001d7c:	00f4b423          	sd	a5,8(s1)
    }
}
    80001d80:	01813083          	ld	ra,24(sp)
    80001d84:	01013403          	ld	s0,16(sp)
    80001d88:	00813483          	ld	s1,8(sp)
    80001d8c:	00013903          	ld	s2,0(sp)
    80001d90:	02010113          	addi	sp,sp,32
    80001d94:	00008067          	ret
    if(!head) { head = tail = newElem; }
    80001d98:	00a4b423          	sd	a0,8(s1)
    80001d9c:	00a4b023          	sd	a0,0(s1)
    80001da0:	fe1ff06f          	j	80001d80 <_ZN7Blocked3putEP3TCB+0x50>

0000000080001da4 <_ZN6Thread7wrapperEPv>:
Thread::Thread() {
    this->body = Thread::wrapper;
    this->arg = this;
}

void Thread::wrapper(void *t) {
    80001da4:	ff010113          	addi	sp,sp,-16
    80001da8:	00113423          	sd	ra,8(sp)
    80001dac:	00813023          	sd	s0,0(sp)
    80001db0:	01010413          	addi	s0,sp,16
    ((Thread*) t)->run();
    80001db4:	00053783          	ld	a5,0(a0)
    80001db8:	0107b783          	ld	a5,16(a5)
    80001dbc:	000780e7          	jalr	a5
}
    80001dc0:	00813083          	ld	ra,8(sp)
    80001dc4:	00013403          	ld	s0,0(sp)
    80001dc8:	01010113          	addi	sp,sp,16
    80001dcc:	00008067          	ret

0000000080001dd0 <_ZN14PeriodicThread3runEv>:
int Semaphore::signal() {
    return sem_signal(myHandle);
}


void PeriodicThread::run() {
    80001dd0:	fe010113          	addi	sp,sp,-32
    80001dd4:	00113c23          	sd	ra,24(sp)
    80001dd8:	00813823          	sd	s0,16(sp)
    80001ddc:	00913423          	sd	s1,8(sp)
    80001de0:	02010413          	addi	s0,sp,32
    80001de4:	00050493          	mv	s1,a0
    while(period) {
    80001de8:	0204b783          	ld	a5,32(s1)
    80001dec:	02078263          	beqz	a5,80001e10 <_ZN14PeriodicThread3runEv+0x40>
        periodicActivation();
    80001df0:	0004b783          	ld	a5,0(s1)
    80001df4:	0187b783          	ld	a5,24(a5)
    80001df8:	00048513          	mv	a0,s1
    80001dfc:	000780e7          	jalr	a5
        time_sleep(period);
    80001e00:	0204b503          	ld	a0,32(s1)
    80001e04:	00000097          	auipc	ra,0x0
    80001e08:	910080e7          	jalr	-1776(ra) # 80001714 <_Z10time_sleepm>
    while(period) {
    80001e0c:	fddff06f          	j	80001de8 <_ZN14PeriodicThread3runEv+0x18>
    }
}
    80001e10:	01813083          	ld	ra,24(sp)
    80001e14:	01013403          	ld	s0,16(sp)
    80001e18:	00813483          	ld	s1,8(sp)
    80001e1c:	02010113          	addi	sp,sp,32
    80001e20:	00008067          	ret

0000000080001e24 <_ZN9SemaphoreD1Ev>:
Semaphore::~Semaphore() {
    80001e24:	ff010113          	addi	sp,sp,-16
    80001e28:	00113423          	sd	ra,8(sp)
    80001e2c:	00813023          	sd	s0,0(sp)
    80001e30:	01010413          	addi	s0,sp,16
    80001e34:	00009797          	auipc	a5,0x9
    80001e38:	79c78793          	addi	a5,a5,1948 # 8000b5d0 <_ZTV9Semaphore+0x10>
    80001e3c:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001e40:	00853503          	ld	a0,8(a0)
    80001e44:	00000097          	auipc	ra,0x0
    80001e48:	828080e7          	jalr	-2008(ra) # 8000166c <_Z9sem_closeP3Sem>
}
    80001e4c:	00813083          	ld	ra,8(sp)
    80001e50:	00013403          	ld	s0,0(sp)
    80001e54:	01010113          	addi	sp,sp,16
    80001e58:	00008067          	ret

0000000080001e5c <_Znwm>:
void *operator new(uint64 size){
    80001e5c:	ff010113          	addi	sp,sp,-16
    80001e60:	00113423          	sd	ra,8(sp)
    80001e64:	00813023          	sd	s0,0(sp)
    80001e68:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80001e6c:	fffff097          	auipc	ra,0xfffff
    80001e70:	650080e7          	jalr	1616(ra) # 800014bc <_Z9mem_allocm>
}
    80001e74:	00813083          	ld	ra,8(sp)
    80001e78:	00013403          	ld	s0,0(sp)
    80001e7c:	01010113          	addi	sp,sp,16
    80001e80:	00008067          	ret

0000000080001e84 <_Znam>:
void *operator new[](uint64 n) {
    80001e84:	ff010113          	addi	sp,sp,-16
    80001e88:	00113423          	sd	ra,8(sp)
    80001e8c:	00813023          	sd	s0,0(sp)
    80001e90:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80001e94:	fffff097          	auipc	ra,0xfffff
    80001e98:	628080e7          	jalr	1576(ra) # 800014bc <_Z9mem_allocm>
}
    80001e9c:	00813083          	ld	ra,8(sp)
    80001ea0:	00013403          	ld	s0,0(sp)
    80001ea4:	01010113          	addi	sp,sp,16
    80001ea8:	00008067          	ret

0000000080001eac <_ZdlPv>:
void operator delete(void *adress) noexcept {
    80001eac:	ff010113          	addi	sp,sp,-16
    80001eb0:	00113423          	sd	ra,8(sp)
    80001eb4:	00813023          	sd	s0,0(sp)
    80001eb8:	01010413          	addi	s0,sp,16
    mem_free(adress);
    80001ebc:	fffff097          	auipc	ra,0xfffff
    80001ec0:	638080e7          	jalr	1592(ra) # 800014f4 <_Z8mem_freePv>
}
    80001ec4:	00813083          	ld	ra,8(sp)
    80001ec8:	00013403          	ld	s0,0(sp)
    80001ecc:	01010113          	addi	sp,sp,16
    80001ed0:	00008067          	ret

0000000080001ed4 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80001ed4:	fe010113          	addi	sp,sp,-32
    80001ed8:	00113c23          	sd	ra,24(sp)
    80001edc:	00813823          	sd	s0,16(sp)
    80001ee0:	00913423          	sd	s1,8(sp)
    80001ee4:	02010413          	addi	s0,sp,32
    80001ee8:	00009797          	auipc	a5,0x9
    80001eec:	6c078793          	addi	a5,a5,1728 # 8000b5a8 <_ZTV6Thread+0x10>
    80001ef0:	00f53023          	sd	a5,0(a0)
    myHandle->setFinished(true);
    80001ef4:	00853783          	ld	a5,8(a0)
    static int sleep(time_t time);

    static TCB *running;

    bool isFinished() const { return finished; }
    void setFinished(bool f) { finished = f; }
    80001ef8:	00100713          	li	a4,1
    80001efc:	02e78423          	sb	a4,40(a5)
    delete myHandle;
    80001f00:	00853483          	ld	s1,8(a0)
    80001f04:	00048e63          	beqz	s1,80001f20 <_ZN6ThreadD1Ev+0x4c>
    80001f08:	00048513          	mv	a0,s1
    80001f0c:	00001097          	auipc	ra,0x1
    80001f10:	81c080e7          	jalr	-2020(ra) # 80002728 <_ZN3TCBD1Ev>
    80001f14:	00048513          	mv	a0,s1
    80001f18:	00000097          	auipc	ra,0x0
    80001f1c:	f94080e7          	jalr	-108(ra) # 80001eac <_ZdlPv>
}
    80001f20:	01813083          	ld	ra,24(sp)
    80001f24:	01013403          	ld	s0,16(sp)
    80001f28:	00813483          	ld	s1,8(sp)
    80001f2c:	02010113          	addi	sp,sp,32
    80001f30:	00008067          	ret

0000000080001f34 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80001f34:	fe010113          	addi	sp,sp,-32
    80001f38:	00113c23          	sd	ra,24(sp)
    80001f3c:	00813823          	sd	s0,16(sp)
    80001f40:	00913423          	sd	s1,8(sp)
    80001f44:	02010413          	addi	s0,sp,32
    80001f48:	00050493          	mv	s1,a0
}
    80001f4c:	00000097          	auipc	ra,0x0
    80001f50:	f88080e7          	jalr	-120(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    80001f54:	00048513          	mv	a0,s1
    80001f58:	00000097          	auipc	ra,0x0
    80001f5c:	f54080e7          	jalr	-172(ra) # 80001eac <_ZdlPv>
    80001f60:	01813083          	ld	ra,24(sp)
    80001f64:	01013403          	ld	s0,16(sp)
    80001f68:	00813483          	ld	s1,8(sp)
    80001f6c:	02010113          	addi	sp,sp,32
    80001f70:	00008067          	ret

0000000080001f74 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001f74:	fe010113          	addi	sp,sp,-32
    80001f78:	00113c23          	sd	ra,24(sp)
    80001f7c:	00813823          	sd	s0,16(sp)
    80001f80:	00913423          	sd	s1,8(sp)
    80001f84:	02010413          	addi	s0,sp,32
    80001f88:	00050493          	mv	s1,a0
}
    80001f8c:	00000097          	auipc	ra,0x0
    80001f90:	e98080e7          	jalr	-360(ra) # 80001e24 <_ZN9SemaphoreD1Ev>
    80001f94:	00048513          	mv	a0,s1
    80001f98:	00000097          	auipc	ra,0x0
    80001f9c:	f14080e7          	jalr	-236(ra) # 80001eac <_ZdlPv>
    80001fa0:	01813083          	ld	ra,24(sp)
    80001fa4:	01013403          	ld	s0,16(sp)
    80001fa8:	00813483          	ld	s1,8(sp)
    80001fac:	02010113          	addi	sp,sp,32
    80001fb0:	00008067          	ret

0000000080001fb4 <_ZdaPv>:
void operator delete[](void *adress) noexcept {
    80001fb4:	ff010113          	addi	sp,sp,-16
    80001fb8:	00113423          	sd	ra,8(sp)
    80001fbc:	00813023          	sd	s0,0(sp)
    80001fc0:	01010413          	addi	s0,sp,16
    mem_free(adress);
    80001fc4:	fffff097          	auipc	ra,0xfffff
    80001fc8:	530080e7          	jalr	1328(ra) # 800014f4 <_Z8mem_freePv>
}
    80001fcc:	00813083          	ld	ra,8(sp)
    80001fd0:	00013403          	ld	s0,0(sp)
    80001fd4:	01010113          	addi	sp,sp,16
    80001fd8:	00008067          	ret

0000000080001fdc <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80001fdc:	ff010113          	addi	sp,sp,-16
    80001fe0:	00813423          	sd	s0,8(sp)
    80001fe4:	01010413          	addi	s0,sp,16
    80001fe8:	00009797          	auipc	a5,0x9
    80001fec:	5c078793          	addi	a5,a5,1472 # 8000b5a8 <_ZTV6Thread+0x10>
    80001ff0:	00f53023          	sd	a5,0(a0)
    80001ff4:	00053423          	sd	zero,8(a0)
    this->body = body;
    80001ff8:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80001ffc:	00c53c23          	sd	a2,24(a0)
}
    80002000:	00813403          	ld	s0,8(sp)
    80002004:	01010113          	addi	sp,sp,16
    80002008:	00008067          	ret

000000008000200c <_ZN6ThreadC1Ev>:
Thread::Thread() {
    8000200c:	ff010113          	addi	sp,sp,-16
    80002010:	00813423          	sd	s0,8(sp)
    80002014:	01010413          	addi	s0,sp,16
    80002018:	00009797          	auipc	a5,0x9
    8000201c:	59078793          	addi	a5,a5,1424 # 8000b5a8 <_ZTV6Thread+0x10>
    80002020:	00f53023          	sd	a5,0(a0)
    80002024:	00053423          	sd	zero,8(a0)
    this->body = Thread::wrapper;
    80002028:	00000797          	auipc	a5,0x0
    8000202c:	d7c78793          	addi	a5,a5,-644 # 80001da4 <_ZN6Thread7wrapperEPv>
    80002030:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80002034:	00a53c23          	sd	a0,24(a0)
}
    80002038:	00813403          	ld	s0,8(sp)
    8000203c:	01010113          	addi	sp,sp,16
    80002040:	00008067          	ret

0000000080002044 <_ZN6Thread5startEv>:
int Thread::start() {
    80002044:	ff010113          	addi	sp,sp,-16
    80002048:	00113423          	sd	ra,8(sp)
    8000204c:	00813023          	sd	s0,0(sp)
    80002050:	01010413          	addi	s0,sp,16
    thread_create(&myHandle , body, arg);
    80002054:	01853603          	ld	a2,24(a0)
    80002058:	01053583          	ld	a1,16(a0)
    8000205c:	00850513          	addi	a0,a0,8
    80002060:	fffff097          	auipc	ra,0xfffff
    80002064:	4cc080e7          	jalr	1228(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
}
    80002068:	00000513          	li	a0,0
    8000206c:	00813083          	ld	ra,8(sp)
    80002070:	00013403          	ld	s0,0(sp)
    80002074:	01010113          	addi	sp,sp,16
    80002078:	00008067          	ret

000000008000207c <_ZN6Thread4joinEv>:
void Thread::join() {
    8000207c:	ff010113          	addi	sp,sp,-16
    80002080:	00113423          	sd	ra,8(sp)
    80002084:	00813023          	sd	s0,0(sp)
    80002088:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    8000208c:	00853503          	ld	a0,8(a0)
    80002090:	fffff097          	auipc	ra,0xfffff
    80002094:	570080e7          	jalr	1392(ra) # 80001600 <_Z11thread_joinP3TCB>
}
    80002098:	00813083          	ld	ra,8(sp)
    8000209c:	00013403          	ld	s0,0(sp)
    800020a0:	01010113          	addi	sp,sp,16
    800020a4:	00008067          	ret

00000000800020a8 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800020a8:	ff010113          	addi	sp,sp,-16
    800020ac:	00113423          	sd	ra,8(sp)
    800020b0:	00813023          	sd	s0,0(sp)
    800020b4:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800020b8:	fffff097          	auipc	ra,0xfffff
    800020bc:	51c080e7          	jalr	1308(ra) # 800015d4 <_Z15thread_dispatchv>
}
    800020c0:	00813083          	ld	ra,8(sp)
    800020c4:	00013403          	ld	s0,0(sp)
    800020c8:	01010113          	addi	sp,sp,16
    800020cc:	00008067          	ret

00000000800020d0 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    800020d0:	ff010113          	addi	sp,sp,-16
    800020d4:	00113423          	sd	ra,8(sp)
    800020d8:	00813023          	sd	s0,0(sp)
    800020dc:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    800020e0:	fffff097          	auipc	ra,0xfffff
    800020e4:	634080e7          	jalr	1588(ra) # 80001714 <_Z10time_sleepm>
}
    800020e8:	00813083          	ld	ra,8(sp)
    800020ec:	00013403          	ld	s0,0(sp)
    800020f0:	01010113          	addi	sp,sp,16
    800020f4:	00008067          	ret

00000000800020f8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800020f8:	ff010113          	addi	sp,sp,-16
    800020fc:	00113423          	sd	ra,8(sp)
    80002100:	00813023          	sd	s0,0(sp)
    80002104:	01010413          	addi	s0,sp,16
    80002108:	00009797          	auipc	a5,0x9
    8000210c:	4c878793          	addi	a5,a5,1224 # 8000b5d0 <_ZTV9Semaphore+0x10>
    80002110:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80002114:	00850513          	addi	a0,a0,8
    80002118:	fffff097          	auipc	ra,0xfffff
    8000211c:	518080e7          	jalr	1304(ra) # 80001630 <_Z8sem_openPP3Semj>
}
    80002120:	00813083          	ld	ra,8(sp)
    80002124:	00013403          	ld	s0,0(sp)
    80002128:	01010113          	addi	sp,sp,16
    8000212c:	00008067          	ret

0000000080002130 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002130:	ff010113          	addi	sp,sp,-16
    80002134:	00113423          	sd	ra,8(sp)
    80002138:	00813023          	sd	s0,0(sp)
    8000213c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002140:	00853503          	ld	a0,8(a0)
    80002144:	fffff097          	auipc	ra,0xfffff
    80002148:	560080e7          	jalr	1376(ra) # 800016a4 <_Z8sem_waitP3Sem>
}
    8000214c:	00813083          	ld	ra,8(sp)
    80002150:	00013403          	ld	s0,0(sp)
    80002154:	01010113          	addi	sp,sp,16
    80002158:	00008067          	ret

000000008000215c <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    8000215c:	ff010113          	addi	sp,sp,-16
    80002160:	00113423          	sd	ra,8(sp)
    80002164:	00813023          	sd	s0,0(sp)
    80002168:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    8000216c:	00853503          	ld	a0,8(a0)
    80002170:	fffff097          	auipc	ra,0xfffff
    80002174:	56c080e7          	jalr	1388(ra) # 800016dc <_Z10sem_signalP3Sem>
}
    80002178:	00813083          	ld	ra,8(sp)
    8000217c:	00013403          	ld	s0,0(sp)
    80002180:	01010113          	addi	sp,sp,16
    80002184:	00008067          	ret

0000000080002188 <_ZN7Console4getcEv>:

char Console::getc() {
    80002188:	ff010113          	addi	sp,sp,-16
    8000218c:	00113423          	sd	ra,8(sp)
    80002190:	00813023          	sd	s0,0(sp)
    80002194:	01010413          	addi	s0,sp,16
    return ::getc();
    80002198:	fffff097          	auipc	ra,0xfffff
    8000219c:	5b4080e7          	jalr	1460(ra) # 8000174c <_Z4getcv>
}
    800021a0:	00813083          	ld	ra,8(sp)
    800021a4:	00013403          	ld	s0,0(sp)
    800021a8:	01010113          	addi	sp,sp,16
    800021ac:	00008067          	ret

00000000800021b0 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    800021b0:	ff010113          	addi	sp,sp,-16
    800021b4:	00113423          	sd	ra,8(sp)
    800021b8:	00813023          	sd	s0,0(sp)
    800021bc:	01010413          	addi	s0,sp,16
    ::putc(c);
    800021c0:	fffff097          	auipc	ra,0xfffff
    800021c4:	5c0080e7          	jalr	1472(ra) # 80001780 <_Z4putcc>
}
    800021c8:	00813083          	ld	ra,8(sp)
    800021cc:	00013403          	ld	s0,0(sp)
    800021d0:	01010113          	addi	sp,sp,16
    800021d4:	00008067          	ret

00000000800021d8 <_ZN6Thread3runEv>:
    static void dispatch();
    static void wrapper(void* t);
    static int sleep(time_t time);
protected:
    Thread();
    virtual void run () {}
    800021d8:	ff010113          	addi	sp,sp,-16
    800021dc:	00813423          	sd	s0,8(sp)
    800021e0:	01010413          	addi	s0,sp,16
    800021e4:	00813403          	ld	s0,8(sp)
    800021e8:	01010113          	addi	sp,sp,16
    800021ec:	00008067          	ret

00000000800021f0 <_ZN14PeriodicThread18periodicActivationEv>:
class PeriodicThread : public Thread {
public:
    void terminate() { period = 0; }
protected:
    PeriodicThread(time_t p) : Thread(), period(p) {}
    virtual void periodicActivation() {}
    800021f0:	ff010113          	addi	sp,sp,-16
    800021f4:	00813423          	sd	s0,8(sp)
    800021f8:	01010413          	addi	s0,sp,16
    800021fc:	00813403          	ld	s0,8(sp)
    80002200:	01010113          	addi	sp,sp,16
    80002204:	00008067          	ret

0000000080002208 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002208:	ff010113          	addi	sp,sp,-16
    8000220c:	00113423          	sd	ra,8(sp)
    80002210:	00813023          	sd	s0,0(sp)
    80002214:	01010413          	addi	s0,sp,16
    80002218:	00009797          	auipc	a5,0x9
    8000221c:	3d878793          	addi	a5,a5,984 # 8000b5f0 <_ZTV14PeriodicThread+0x10>
    80002220:	00f53023          	sd	a5,0(a0)
    80002224:	00000097          	auipc	ra,0x0
    80002228:	cb0080e7          	jalr	-848(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    8000222c:	00813083          	ld	ra,8(sp)
    80002230:	00013403          	ld	s0,0(sp)
    80002234:	01010113          	addi	sp,sp,16
    80002238:	00008067          	ret

000000008000223c <_ZN14PeriodicThreadD0Ev>:
    8000223c:	fe010113          	addi	sp,sp,-32
    80002240:	00113c23          	sd	ra,24(sp)
    80002244:	00813823          	sd	s0,16(sp)
    80002248:	00913423          	sd	s1,8(sp)
    8000224c:	02010413          	addi	s0,sp,32
    80002250:	00050493          	mv	s1,a0
    80002254:	00009797          	auipc	a5,0x9
    80002258:	39c78793          	addi	a5,a5,924 # 8000b5f0 <_ZTV14PeriodicThread+0x10>
    8000225c:	00f53023          	sd	a5,0(a0)
    80002260:	00000097          	auipc	ra,0x0
    80002264:	c74080e7          	jalr	-908(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    80002268:	00048513          	mv	a0,s1
    8000226c:	00000097          	auipc	ra,0x0
    80002270:	c40080e7          	jalr	-960(ra) # 80001eac <_ZdlPv>
    80002274:	01813083          	ld	ra,24(sp)
    80002278:	01013403          	ld	s0,16(sp)
    8000227c:	00813483          	ld	s1,8(sp)
    80002280:	02010113          	addi	sp,sp,32
    80002284:	00008067          	ret

0000000080002288 <_ZN8Sleeping3getEv>:
#include "../h/Sleeping.hpp"

Sleeping::Elem* Sleeping::head = nullptr;

void Sleeping::get() {
    80002288:	fe010113          	addi	sp,sp,-32
    8000228c:	00113c23          	sd	ra,24(sp)
    80002290:	00813823          	sd	s0,16(sp)
    80002294:	00913423          	sd	s1,8(sp)
    80002298:	01213023          	sd	s2,0(sp)
    8000229c:	02010413          	addi	s0,sp,32
    if(!head) return;
    800022a0:	00009497          	auipc	s1,0x9
    800022a4:	5c84b483          	ld	s1,1480(s1) # 8000b868 <_ZN8Sleeping4headE>
    800022a8:	00048a63          	beqz	s1,800022bc <_ZN8Sleeping3getEv+0x34>
    head->time--;
    800022ac:	0104b783          	ld	a5,16(s1)
    800022b0:	fff78793          	addi	a5,a5,-1
    800022b4:	00f4b823          	sd	a5,16(s1)
    if(!head->time) {
    800022b8:	02078063          	beqz	a5,800022d8 <_ZN8Sleeping3getEv+0x50>
                break;
            }
        }
        if(!cur) head = cur;
    }
}
    800022bc:	01813083          	ld	ra,24(sp)
    800022c0:	01013403          	ld	s0,16(sp)
    800022c4:	00813483          	ld	s1,8(sp)
    800022c8:	00013903          	ld	s2,0(sp)
    800022cc:	02010113          	addi	sp,sp,32
    800022d0:	00008067          	ret
void Sleeping::get() {
    800022d4:	00090493          	mv	s1,s2
        while(cur) {
    800022d8:	04048063          	beqz	s1,80002318 <_ZN8Sleeping3getEv+0x90>
            if(!cur->time) {
    800022dc:	0104b783          	ld	a5,16(s1)
    800022e0:	02079863          	bnez	a5,80002310 <_ZN8Sleeping3getEv+0x88>
                Scheduler::put(cur->thread);
    800022e4:	0004b503          	ld	a0,0(s1)
    800022e8:	fffff097          	auipc	ra,0xfffff
    800022ec:	758080e7          	jalr	1880(ra) # 80001a40 <_ZN9Scheduler3putEP3TCB>
                cur->thread->setSleeping(false);
    800022f0:	0004b783          	ld	a5,0(s1)
    bool isJoined() const { return joined; }
    void setJoined(bool b) { joined = b; }
    bool isBlocked() const { return blocked; }
    void setBlocked(bool b) { blocked = b; }
    bool isSleeping() const { return sleeping; }
    void setSleeping(bool b) { sleeping = b; }
    800022f4:	020785a3          	sb	zero,43(a5)
                cur = cur->next;
    800022f8:	0084b903          	ld	s2,8(s1)
                delete f;
    800022fc:	fc048ce3          	beqz	s1,800022d4 <_ZN8Sleeping3getEv+0x4c>
    80002300:	00048513          	mv	a0,s1
    80002304:	00000097          	auipc	ra,0x0
    80002308:	ba8080e7          	jalr	-1112(ra) # 80001eac <_ZdlPv>
    8000230c:	fc9ff06f          	j	800022d4 <_ZN8Sleeping3getEv+0x4c>
                head = cur;
    80002310:	00009797          	auipc	a5,0x9
    80002314:	5497bc23          	sd	s1,1368(a5) # 8000b868 <_ZN8Sleeping4headE>
        if(!cur) head = cur;
    80002318:	fa0492e3          	bnez	s1,800022bc <_ZN8Sleeping3getEv+0x34>
    8000231c:	00009797          	auipc	a5,0x9
    80002320:	5497b623          	sd	s1,1356(a5) # 8000b868 <_ZN8Sleeping4headE>
    80002324:	f99ff06f          	j	800022bc <_ZN8Sleeping3getEv+0x34>

0000000080002328 <_ZN8Sleeping3putEP3TCBm>:

void Sleeping::put(TCB *t, time_t time) {
    80002328:	fe010113          	addi	sp,sp,-32
    8000232c:	00113c23          	sd	ra,24(sp)
    80002330:	00813823          	sd	s0,16(sp)
    80002334:	00913423          	sd	s1,8(sp)
    80002338:	01213023          	sd	s2,0(sp)
    8000233c:	02010413          	addi	s0,sp,32
    80002340:	00050913          	mv	s2,a0
    80002344:	00058493          	mv	s1,a1
    Elem *newElem = new Elem(t, nullptr, time);
    80002348:	01800513          	li	a0,24
    8000234c:	00000097          	auipc	ra,0x0
    80002350:	b10080e7          	jalr	-1264(ra) # 80001e5c <_Znwm>
class Sleeping {
    struct Elem {
        TCB *thread;
        Elem *next = nullptr;
        time_t time;
        Elem(TCB *t, Elem *n, time_t tm) : thread(t), next(n), time(tm) {}
    80002354:	01253023          	sd	s2,0(a0)
    80002358:	00053423          	sd	zero,8(a0)
    8000235c:	00953823          	sd	s1,16(a0)

    if(!head) { head = newElem; }
    80002360:	00009797          	auipc	a5,0x9
    80002364:	5087b783          	ld	a5,1288(a5) # 8000b868 <_ZN8Sleeping4headE>
    80002368:	00078663          	beqz	a5,80002374 <_ZN8Sleeping3putEP3TCBm+0x4c>
    else {
        Elem *cur = head, *prev = nullptr;
    8000236c:	00000613          	li	a2,0
    80002370:	0200006f          	j	80002390 <_ZN8Sleeping3putEP3TCBm+0x68>
    if(!head) { head = newElem; }
    80002374:	00009797          	auipc	a5,0x9
    80002378:	4ea7ba23          	sd	a0,1268(a5) # 8000b868 <_ZN8Sleeping4headE>
    8000237c:	0540006f          	j	800023d0 <_ZN8Sleeping3putEP3TCBm+0xa8>
        for(; cur; cur = cur->next) {
            if(newElem->time >= cur->time) {
                newElem->time -= cur->time;
    80002380:	40d70733          	sub	a4,a4,a3
    80002384:	00e53823          	sd	a4,16(a0)
            } else break;
            prev = cur;
    80002388:	00078613          	mv	a2,a5
        for(; cur; cur = cur->next) {
    8000238c:	0087b783          	ld	a5,8(a5)
    80002390:	00078863          	beqz	a5,800023a0 <_ZN8Sleeping3putEP3TCBm+0x78>
            if(newElem->time >= cur->time) {
    80002394:	01053703          	ld	a4,16(a0)
    80002398:	0107b683          	ld	a3,16(a5)
    8000239c:	fed772e3          	bgeu	a4,a3,80002380 <_ZN8Sleeping3putEP3TCBm+0x58>
        }
        if(prev) prev->next = newElem;
    800023a0:	00060463          	beqz	a2,800023a8 <_ZN8Sleeping3putEP3TCBm+0x80>
    800023a4:	00a63423          	sd	a0,8(a2)
        newElem->next = cur;
    800023a8:	00f53423          	sd	a5,8(a0)
        if(!prev) head = newElem;
    800023ac:	02060e63          	beqz	a2,800023e8 <_ZN8Sleeping3putEP3TCBm+0xc0>
        if(cur) {
    800023b0:	02078063          	beqz	a5,800023d0 <_ZN8Sleeping3putEP3TCBm+0xa8>
            if(prev) cur->time -= newElem->time - prev->time;
    800023b4:	04060063          	beqz	a2,800023f4 <_ZN8Sleeping3putEP3TCBm+0xcc>
    800023b8:	01063703          	ld	a4,16(a2)
    800023bc:	01053683          	ld	a3,16(a0)
    800023c0:	40d706b3          	sub	a3,a4,a3
    800023c4:	0107b703          	ld	a4,16(a5)
    800023c8:	00d70733          	add	a4,a4,a3
    800023cc:	00e7b823          	sd	a4,16(a5)
            else cur->time -= newElem->time;
        }
    }
}
    800023d0:	01813083          	ld	ra,24(sp)
    800023d4:	01013403          	ld	s0,16(sp)
    800023d8:	00813483          	ld	s1,8(sp)
    800023dc:	00013903          	ld	s2,0(sp)
    800023e0:	02010113          	addi	sp,sp,32
    800023e4:	00008067          	ret
        if(!prev) head = newElem;
    800023e8:	00009717          	auipc	a4,0x9
    800023ec:	48a73023          	sd	a0,1152(a4) # 8000b868 <_ZN8Sleeping4headE>
    800023f0:	fc1ff06f          	j	800023b0 <_ZN8Sleeping3putEP3TCBm+0x88>
            else cur->time -= newElem->time;
    800023f4:	01053683          	ld	a3,16(a0)
    800023f8:	0107b703          	ld	a4,16(a5)
    800023fc:	40d70733          	sub	a4,a4,a3
    80002400:	00e7b823          	sd	a4,16(a5)
}
    80002404:	fcdff06f          	j	800023d0 <_ZN8Sleeping3putEP3TCBm+0xa8>

0000000080002408 <_ZN3TCBC1EPFvPvES0_S0_>:
    *handle = new TCB(body, arg, stack);
    if(*handle) return 0;
    else return -1;
}

TCB::TCB(TCB::Body b, void *a, void *s) : body(b), arg(a) {
    80002408:	fe010113          	addi	sp,sp,-32
    8000240c:	00113c23          	sd	ra,24(sp)
    80002410:	00813823          	sd	s0,16(sp)
    80002414:	00913423          	sd	s1,8(sp)
    80002418:	02010413          	addi	s0,sp,32
    8000241c:	00050493          	mv	s1,a0
    80002420:	00b53023          	sd	a1,0(a0)
    80002424:	00c53423          	sd	a2,8(a0)
    80002428:	02050423          	sb	zero,40(a0)
    8000242c:	020504a3          	sb	zero,41(a0)
    80002430:	02050523          	sb	zero,42(a0)
    80002434:	020505a3          	sb	zero,43(a0)
    80002438:	00200793          	li	a5,2
    8000243c:	02f53823          	sd	a5,48(a0)
    80002440:	04053023          	sd	zero,64(a0)
    if(body) stack = (uint64 *) s;
    80002444:	06058063          	beqz	a1,800024a4 <_ZN3TCBC1EPFvPvES0_S0_+0x9c>
    80002448:	00d53823          	sd	a3,16(a0)
    else {
        stack = nullptr;
        delete[] (uint64 *) s;
    }
    if(stack) context.sp = (uint64) &stack[DEFAULT_STACK_SIZE];
    8000244c:	0104b783          	ld	a5,16(s1)
    80002450:	06078663          	beqz	a5,800024bc <_ZN3TCBC1EPFvPvES0_S0_+0xb4>
    80002454:	00008737          	lui	a4,0x8
    80002458:	00e787b3          	add	a5,a5,a4
    8000245c:	00f4bc23          	sd	a5,24(s1)
    else context.sp = 0;
    if(body) context.ra = (uint64) &TCB::threadWrapper;
    80002460:	0004b783          	ld	a5,0(s1)
    80002464:	06078063          	beqz	a5,800024c4 <_ZN3TCBC1EPFvPvES0_S0_+0xbc>
    80002468:	00000717          	auipc	a4,0x0
    8000246c:	3b870713          	addi	a4,a4,952 # 80002820 <_ZN3TCB13threadWrapperEv>
    80002470:	02e4b023          	sd	a4,32(s1)
    else context.ra = 0;
    if(body) Scheduler::put(this);
    80002474:	00078863          	beqz	a5,80002484 <_ZN3TCBC1EPFvPvES0_S0_+0x7c>
    80002478:	00048513          	mv	a0,s1
    8000247c:	fffff097          	auipc	ra,0xfffff
    80002480:	5c4080e7          	jalr	1476(ra) # 80001a40 <_ZN9Scheduler3putEP3TCB>
    userModeThread = userMode;
    80002484:	00009797          	auipc	a5,0x9
    80002488:	3ec7c783          	lbu	a5,1004(a5) # 8000b870 <_ZN3TCB8userModeE>
    8000248c:	02f48c23          	sb	a5,56(s1)
}
    80002490:	01813083          	ld	ra,24(sp)
    80002494:	01013403          	ld	s0,16(sp)
    80002498:	00813483          	ld	s1,8(sp)
    8000249c:	02010113          	addi	sp,sp,32
    800024a0:	00008067          	ret
        stack = nullptr;
    800024a4:	00053823          	sd	zero,16(a0)
        delete[] (uint64 *) s;
    800024a8:	fa0682e3          	beqz	a3,8000244c <_ZN3TCBC1EPFvPvES0_S0_+0x44>
    800024ac:	00068513          	mv	a0,a3
    800024b0:	00000097          	auipc	ra,0x0
    800024b4:	b04080e7          	jalr	-1276(ra) # 80001fb4 <_ZdaPv>
    800024b8:	f95ff06f          	j	8000244c <_ZN3TCBC1EPFvPvES0_S0_+0x44>
    else context.sp = 0;
    800024bc:	0004bc23          	sd	zero,24(s1)
    800024c0:	fa1ff06f          	j	80002460 <_ZN3TCBC1EPFvPvES0_S0_+0x58>
    else context.ra = 0;
    800024c4:	0204b023          	sd	zero,32(s1)
    800024c8:	fadff06f          	j	80002474 <_ZN3TCBC1EPFvPvES0_S0_+0x6c>

00000000800024cc <_ZN3TCB12createThreadEPPS_PFvPvES2_S2_>:
int TCB::createThread(TCB **handle, TCB::Body body, void *arg, void *stack) {
    800024cc:	fc010113          	addi	sp,sp,-64
    800024d0:	02113c23          	sd	ra,56(sp)
    800024d4:	02813823          	sd	s0,48(sp)
    800024d8:	02913423          	sd	s1,40(sp)
    800024dc:	03213023          	sd	s2,32(sp)
    800024e0:	01313c23          	sd	s3,24(sp)
    800024e4:	01413823          	sd	s4,16(sp)
    800024e8:	01513423          	sd	s5,8(sp)
    800024ec:	04010413          	addi	s0,sp,64
    800024f0:	00050913          	mv	s2,a0
    800024f4:	00058993          	mv	s3,a1
    800024f8:	00060a13          	mv	s4,a2
    800024fc:	00068a93          	mv	s5,a3
    *handle = new TCB(body, arg, stack);
    80002500:	04800513          	li	a0,72
    80002504:	00000097          	auipc	ra,0x0
    80002508:	958080e7          	jalr	-1704(ra) # 80001e5c <_Znwm>
    8000250c:	00050493          	mv	s1,a0
    80002510:	000a8693          	mv	a3,s5
    80002514:	000a0613          	mv	a2,s4
    80002518:	00098593          	mv	a1,s3
    8000251c:	00000097          	auipc	ra,0x0
    80002520:	eec080e7          	jalr	-276(ra) # 80002408 <_ZN3TCBC1EPFvPvES0_S0_>
    80002524:	00993023          	sd	s1,0(s2)
    if(*handle) return 0;
    80002528:	02048663          	beqz	s1,80002554 <_ZN3TCB12createThreadEPPS_PFvPvES2_S2_+0x88>
    8000252c:	00000513          	li	a0,0
}
    80002530:	03813083          	ld	ra,56(sp)
    80002534:	03013403          	ld	s0,48(sp)
    80002538:	02813483          	ld	s1,40(sp)
    8000253c:	02013903          	ld	s2,32(sp)
    80002540:	01813983          	ld	s3,24(sp)
    80002544:	01013a03          	ld	s4,16(sp)
    80002548:	00813a83          	ld	s5,8(sp)
    8000254c:	04010113          	addi	sp,sp,64
    80002550:	00008067          	ret
    else return -1;
    80002554:	fff00513          	li	a0,-1
    80002558:	fd9ff06f          	j	80002530 <_ZN3TCB12createThreadEPPS_PFvPvES2_S2_+0x64>
    8000255c:	00050913          	mv	s2,a0
    *handle = new TCB(body, arg, stack);
    80002560:	00048513          	mv	a0,s1
    80002564:	00000097          	auipc	ra,0x0
    80002568:	948080e7          	jalr	-1720(ra) # 80001eac <_ZdlPv>
    8000256c:	00090513          	mv	a0,s2
    80002570:	0000b097          	auipc	ra,0xb
    80002574:	c78080e7          	jalr	-904(ra) # 8000d1e8 <_Unwind_Resume>

0000000080002578 <_ZN3TCB8dispatchEv>:
    pushRegisters();
    TCB::dispatch();
    popRegisters();
}

void TCB::dispatch() {
    80002578:	fe010113          	addi	sp,sp,-32
    8000257c:	00113c23          	sd	ra,24(sp)
    80002580:	00813823          	sd	s0,16(sp)
    80002584:	00913423          	sd	s1,8(sp)
    80002588:	02010413          	addi	s0,sp,32
    TCB *old = TCB::running;
    8000258c:	00009497          	auipc	s1,0x9
    80002590:	2ec4b483          	ld	s1,748(s1) # 8000b878 <_ZN3TCB7runningE>
    bool isFinished() const { return finished; }
    80002594:	0284c783          	lbu	a5,40(s1)
    if(!old->isFinished() && !old->isJoined() && !old->isBlocked() && !old->isSleeping()) { Scheduler::put(old); }
    80002598:	00079e63          	bnez	a5,800025b4 <_ZN3TCB8dispatchEv+0x3c>
    bool isJoined() const { return joined; }
    8000259c:	0294c783          	lbu	a5,41(s1)
    800025a0:	00079a63          	bnez	a5,800025b4 <_ZN3TCB8dispatchEv+0x3c>
    bool isBlocked() const { return blocked; }
    800025a4:	02a4c783          	lbu	a5,42(s1)
    800025a8:	00079663          	bnez	a5,800025b4 <_ZN3TCB8dispatchEv+0x3c>
    bool isSleeping() const { return sleeping; }
    800025ac:	02b4c783          	lbu	a5,43(s1)
    800025b0:	02078e63          	beqz	a5,800025ec <_ZN3TCB8dispatchEv+0x74>
    TCB::running = Scheduler::get();
    800025b4:	fffff097          	auipc	ra,0xfffff
    800025b8:	424080e7          	jalr	1060(ra) # 800019d8 <_ZN9Scheduler3getEv>
    800025bc:	00009797          	auipc	a5,0x9
    800025c0:	2aa7be23          	sd	a0,700(a5) # 8000b878 <_ZN3TCB7runningE>
    if(old != TCB::running) contextSwitch(&old->context, &TCB::running->context);
    800025c4:	00a48a63          	beq	s1,a0,800025d8 <_ZN3TCB8dispatchEv+0x60>
    800025c8:	01850593          	addi	a1,a0,24
    800025cc:	01848513          	addi	a0,s1,24
    800025d0:	fffff097          	auipc	ra,0xfffff
    800025d4:	d88080e7          	jalr	-632(ra) # 80001358 <contextSwitch>
}
    800025d8:	01813083          	ld	ra,24(sp)
    800025dc:	01013403          	ld	s0,16(sp)
    800025e0:	00813483          	ld	s1,8(sp)
    800025e4:	02010113          	addi	sp,sp,32
    800025e8:	00008067          	ret
    if(!old->isFinished() && !old->isJoined() && !old->isBlocked() && !old->isSleeping()) { Scheduler::put(old); }
    800025ec:	00048513          	mv	a0,s1
    800025f0:	fffff097          	auipc	ra,0xfffff
    800025f4:	450080e7          	jalr	1104(ra) # 80001a40 <_ZN9Scheduler3putEP3TCB>
    800025f8:	fbdff06f          	j	800025b4 <_ZN3TCB8dispatchEv+0x3c>

00000000800025fc <_ZN3TCB5yieldEv>:
void TCB::yield() {
    800025fc:	ff010113          	addi	sp,sp,-16
    80002600:	00113423          	sd	ra,8(sp)
    80002604:	00813023          	sd	s0,0(sp)
    80002608:	01010413          	addi	s0,sp,16
    pushRegisters();
    8000260c:	fffff097          	auipc	ra,0xfffff
    80002610:	d60080e7          	jalr	-672(ra) # 8000136c <pushRegisters>
    TCB::dispatch();
    80002614:	00000097          	auipc	ra,0x0
    80002618:	f64080e7          	jalr	-156(ra) # 80002578 <_ZN3TCB8dispatchEv>
    popRegisters();
    8000261c:	fffff097          	auipc	ra,0xfffff
    80002620:	dcc080e7          	jalr	-564(ra) # 800013e8 <popRegisters>
}
    80002624:	00813083          	ld	ra,8(sp)
    80002628:	00013403          	ld	s0,0(sp)
    8000262c:	01010113          	addi	sp,sp,16
    80002630:	00008067          	ret

0000000080002634 <_ZN3TCB4joinEPS_>:
    bool isFinished() const { return finished; }
    80002634:	02854783          	lbu	a5,40(a0)

void TCB::join(TCB *handle) {
    if(handle->isFinished()) return;
    80002638:	00078463          	beqz	a5,80002640 <_ZN3TCB4joinEPS_+0xc>
    8000263c:	00008067          	ret
void TCB::join(TCB *handle) {
    80002640:	fe010113          	addi	sp,sp,-32
    80002644:	00113c23          	sd	ra,24(sp)
    80002648:	00813823          	sd	s0,16(sp)
    8000264c:	00913423          	sd	s1,8(sp)
    80002650:	01213023          	sd	s2,0(sp)
    80002654:	02010413          	addi	s0,sp,32
    80002658:	00050493          	mv	s1,a0
    TCB::running->setJoined(true);
    8000265c:	00009917          	auipc	s2,0x9
    80002660:	21490913          	addi	s2,s2,532 # 8000b870 <_ZN3TCB8userModeE>
    80002664:	00893783          	ld	a5,8(s2)
    void setJoined(bool b) { joined = b; }
    80002668:	00100713          	li	a4,1
    8000266c:	02e784a3          	sb	a4,41(a5)

    Elem *newElem = new Elem(TCB::running, nullptr);
    80002670:	01000513          	li	a0,16
    80002674:	fffff097          	auipc	ra,0xfffff
    80002678:	7e8080e7          	jalr	2024(ra) # 80001e5c <_Znwm>
    8000267c:	00893783          	ld	a5,8(s2)
    bool userModeThread;

    struct Elem {
        TCB *thread;
        Elem *next = nullptr;
        Elem(TCB *p, Elem *n) : thread(p), next(n) {}
    80002680:	00f53023          	sd	a5,0(a0)
    80002684:	00053423          	sd	zero,8(a0)
    if(!handle->headWaitList) { handle->headWaitList = newElem; }
    80002688:	0404b783          	ld	a5,64(s1)
    8000268c:	02078663          	beqz	a5,800026b8 <_ZN3TCB4joinEPS_+0x84>
    else {
        newElem->next = handle->headWaitList;
    80002690:	00f53423          	sd	a5,8(a0)
        handle->headWaitList = newElem;
    80002694:	04a4b023          	sd	a0,64(s1)
    }

    TCB::yield();
    80002698:	00000097          	auipc	ra,0x0
    8000269c:	f64080e7          	jalr	-156(ra) # 800025fc <_ZN3TCB5yieldEv>
}
    800026a0:	01813083          	ld	ra,24(sp)
    800026a4:	01013403          	ld	s0,16(sp)
    800026a8:	00813483          	ld	s1,8(sp)
    800026ac:	00013903          	ld	s2,0(sp)
    800026b0:	02010113          	addi	sp,sp,32
    800026b4:	00008067          	ret
    if(!handle->headWaitList) { handle->headWaitList = newElem; }
    800026b8:	04a4b023          	sd	a0,64(s1)
    800026bc:	fddff06f          	j	80002698 <_ZN3TCB4joinEPS_+0x64>

00000000800026c0 <_ZN3TCB8waitListEv>:

void TCB::waitList() {
    800026c0:	fe010113          	addi	sp,sp,-32
    800026c4:	00113c23          	sd	ra,24(sp)
    800026c8:	00813823          	sd	s0,16(sp)
    800026cc:	00913423          	sd	s1,8(sp)
    800026d0:	02010413          	addi	s0,sp,32
    800026d4:	00050493          	mv	s1,a0
    Elem *prev;
    while(headWaitList) {
    800026d8:	0404b783          	ld	a5,64(s1)
    800026dc:	02078c63          	beqz	a5,80002714 <_ZN3TCB8waitListEv+0x54>
        Scheduler::put(headWaitList->thread);
    800026e0:	0007b503          	ld	a0,0(a5)
    800026e4:	fffff097          	auipc	ra,0xfffff
    800026e8:	35c080e7          	jalr	860(ra) # 80001a40 <_ZN9Scheduler3putEP3TCB>
        headWaitList->thread->setJoined(false);
    800026ec:	0404b783          	ld	a5,64(s1)
    800026f0:	0007b783          	ld	a5,0(a5)
    void setJoined(bool b) { joined = b; }
    800026f4:	020784a3          	sb	zero,41(a5)
        prev = headWaitList;
    800026f8:	0404b503          	ld	a0,64(s1)
        headWaitList = headWaitList->next;
    800026fc:	00853783          	ld	a5,8(a0)
    80002700:	04f4b023          	sd	a5,64(s1)
        delete prev;
    80002704:	fc050ae3          	beqz	a0,800026d8 <_ZN3TCB8waitListEv+0x18>
    80002708:	fffff097          	auipc	ra,0xfffff
    8000270c:	7a4080e7          	jalr	1956(ra) # 80001eac <_ZdlPv>
    80002710:	fc9ff06f          	j	800026d8 <_ZN3TCB8waitListEv+0x18>
    }
}
    80002714:	01813083          	ld	ra,24(sp)
    80002718:	01013403          	ld	s0,16(sp)
    8000271c:	00813483          	ld	s1,8(sp)
    80002720:	02010113          	addi	sp,sp,32
    80002724:	00008067          	ret

0000000080002728 <_ZN3TCBD1Ev>:
TCB::~TCB() {
    80002728:	fe010113          	addi	sp,sp,-32
    8000272c:	00113c23          	sd	ra,24(sp)
    80002730:	00813823          	sd	s0,16(sp)
    80002734:	00913423          	sd	s1,8(sp)
    80002738:	02010413          	addi	s0,sp,32
    8000273c:	00050493          	mv	s1,a0
    delete[] stack;
    80002740:	01053503          	ld	a0,16(a0)
    80002744:	00050663          	beqz	a0,80002750 <_ZN3TCBD1Ev+0x28>
    80002748:	00000097          	auipc	ra,0x0
    8000274c:	86c080e7          	jalr	-1940(ra) # 80001fb4 <_ZdaPv>
    waitList();
    80002750:	00048513          	mv	a0,s1
    80002754:	00000097          	auipc	ra,0x0
    80002758:	f6c080e7          	jalr	-148(ra) # 800026c0 <_ZN3TCB8waitListEv>
}
    8000275c:	01813083          	ld	ra,24(sp)
    80002760:	01013403          	ld	s0,16(sp)
    80002764:	00813483          	ld	s1,8(sp)
    80002768:	02010113          	addi	sp,sp,32
    8000276c:	00008067          	ret

0000000080002770 <_ZN3TCB5sleepEm>:

int TCB::sleep(time_t time) {
    if(!time) return 0;
    80002770:	00051663          	bnez	a0,8000277c <_ZN3TCB5sleepEm+0xc>
    Sleeping::put(TCB::running, time);
    TCB::running->setSleeping(true);
    TCB::yield();
    return 0;
}
    80002774:	00000513          	li	a0,0
    80002778:	00008067          	ret
int TCB::sleep(time_t time) {
    8000277c:	fe010113          	addi	sp,sp,-32
    80002780:	00113c23          	sd	ra,24(sp)
    80002784:	00813823          	sd	s0,16(sp)
    80002788:	00913423          	sd	s1,8(sp)
    8000278c:	02010413          	addi	s0,sp,32
    Sleeping::put(TCB::running, time);
    80002790:	00009497          	auipc	s1,0x9
    80002794:	0e048493          	addi	s1,s1,224 # 8000b870 <_ZN3TCB8userModeE>
    80002798:	00050593          	mv	a1,a0
    8000279c:	0084b503          	ld	a0,8(s1)
    800027a0:	00000097          	auipc	ra,0x0
    800027a4:	b88080e7          	jalr	-1144(ra) # 80002328 <_ZN8Sleeping3putEP3TCBm>
    TCB::running->setSleeping(true);
    800027a8:	0084b783          	ld	a5,8(s1)
    void setSleeping(bool b) { sleeping = b; }
    800027ac:	00100713          	li	a4,1
    800027b0:	02e785a3          	sb	a4,43(a5)
    TCB::yield();
    800027b4:	00000097          	auipc	ra,0x0
    800027b8:	e48080e7          	jalr	-440(ra) # 800025fc <_ZN3TCB5yieldEv>
}
    800027bc:	00000513          	li	a0,0
    800027c0:	01813083          	ld	ra,24(sp)
    800027c4:	01013403          	ld	s0,16(sp)
    800027c8:	00813483          	ld	s1,8(sp)
    800027cc:	02010113          	addi	sp,sp,32
    800027d0:	00008067          	ret

00000000800027d4 <_ZN3TCB10popSppSpieEv>:

void TCB::popSppSpie() {
    800027d4:	ff010113          	addi	sp,sp,-16
    800027d8:	00813423          	sd	s0,8(sp)
    800027dc:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    800027e0:	14109073          	csrw	sepc,ra
    int maskSPIE = 1 << 5;
    __asm__ volatile("csrs sstatus, %0" : :  "r"(maskSPIE));
    800027e4:	02000793          	li	a5,32
    800027e8:	1007a073          	csrs	sstatus,a5
    int maskSPP = 1 << 8;
    if(TCB::running->userModeThread) __asm__ volatile("csrc sstatus, %0" : :  "r"(maskSPP));
    800027ec:	00009797          	auipc	a5,0x9
    800027f0:	08c7b783          	ld	a5,140(a5) # 8000b878 <_ZN3TCB7runningE>
    800027f4:	0387c783          	lbu	a5,56(a5)
    800027f8:	00078e63          	beqz	a5,80002814 <_ZN3TCB10popSppSpieEv+0x40>
    800027fc:	10000793          	li	a5,256
    80002800:	1007b073          	csrc	sstatus,a5
    else __asm__ volatile("csrs sstatus, %0" : :  "r"(maskSPP));
    __asm__ volatile("sret");
    80002804:	10200073          	sret
}
    80002808:	00813403          	ld	s0,8(sp)
    8000280c:	01010113          	addi	sp,sp,16
    80002810:	00008067          	ret
    else __asm__ volatile("csrs sstatus, %0" : :  "r"(maskSPP));
    80002814:	10000793          	li	a5,256
    80002818:	1007a073          	csrs	sstatus,a5
    8000281c:	fe9ff06f          	j	80002804 <_ZN3TCB10popSppSpieEv+0x30>

0000000080002820 <_ZN3TCB13threadWrapperEv>:

void TCB::threadWrapper() {
    80002820:	fe010113          	addi	sp,sp,-32
    80002824:	00113c23          	sd	ra,24(sp)
    80002828:	00813823          	sd	s0,16(sp)
    8000282c:	00913423          	sd	s1,8(sp)
    80002830:	02010413          	addi	s0,sp,32
    TCB::popSppSpie();
    80002834:	00000097          	auipc	ra,0x0
    80002838:	fa0080e7          	jalr	-96(ra) # 800027d4 <_ZN3TCB10popSppSpieEv>
    TCB::running->body(TCB::running->arg);
    8000283c:	00009497          	auipc	s1,0x9
    80002840:	03448493          	addi	s1,s1,52 # 8000b870 <_ZN3TCB8userModeE>
    80002844:	0084b783          	ld	a5,8(s1)
    80002848:	0007b703          	ld	a4,0(a5)
    8000284c:	0087b503          	ld	a0,8(a5)
    80002850:	000700e7          	jalr	a4
    TCB::running->setFinished(true);
    80002854:	0084b503          	ld	a0,8(s1)
    void setFinished(bool f) { finished = f; }
    80002858:	00100793          	li	a5,1
    8000285c:	02f50423          	sb	a5,40(a0)
    TCB::running->waitList();
    80002860:	00000097          	auipc	ra,0x0
    80002864:	e60080e7          	jalr	-416(ra) # 800026c0 <_ZN3TCB8waitListEv>
    thread_dispatch();
    80002868:	fffff097          	auipc	ra,0xfffff
    8000286c:	d6c080e7          	jalr	-660(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80002870:	01813083          	ld	ra,24(sp)
    80002874:	01013403          	ld	s0,16(sp)
    80002878:	00813483          	ld	s1,8(sp)
    8000287c:	02010113          	addi	sp,sp,32
    80002880:	00008067          	ret

0000000080002884 <_ZN15MemoryAllocator10initializeEv>:

MemoryAllocator::MemSegment* MemoryAllocator::freeMemHead;
MemoryAllocator::MemSegment* MemoryAllocator::usedMemHead;
bool MemoryAllocator::initialized = false;

void MemoryAllocator::initialize() {
    80002884:	ff010113          	addi	sp,sp,-16
    80002888:	00813423          	sd	s0,8(sp)
    8000288c:	01010413          	addi	s0,sp,16
    freeMemHead = (MemSegment *) HEAP_START_ADDR;
    80002890:	00009617          	auipc	a2,0x9
    80002894:	f4063603          	ld	a2,-192(a2) # 8000b7d0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002898:	00063703          	ld	a4,0(a2)
    8000289c:	00009797          	auipc	a5,0x9
    800028a0:	fec78793          	addi	a5,a5,-20 # 8000b888 <_ZN15MemoryAllocator11freeMemHeadE>
    800028a4:	00e7b023          	sd	a4,0(a5)
    freeMemHead->next = nullptr;
    800028a8:	00073023          	sd	zero,0(a4)
    freeMemHead->prev = nullptr;
    800028ac:	0007b683          	ld	a3,0(a5)
    800028b0:	0006b423          	sd	zero,8(a3)
    freeMemHead->size = (uint64) HEAP_END_ADDR - (uint64) HEAP_START_ADDR;
    800028b4:	00009717          	auipc	a4,0x9
    800028b8:	f4c73703          	ld	a4,-180(a4) # 8000b800 <_GLOBAL_OFFSET_TABLE_+0x48>
    800028bc:	00073703          	ld	a4,0(a4)
    800028c0:	00063603          	ld	a2,0(a2)
    800028c4:	40c70733          	sub	a4,a4,a2
    800028c8:	00e6b823          	sd	a4,16(a3)
    usedMemHead = nullptr;
    800028cc:	0007b423          	sd	zero,8(a5)
}
    800028d0:	00813403          	ld	s0,8(sp)
    800028d4:	01010113          	addi	sp,sp,16
    800028d8:	00008067          	ret

00000000800028dc <_ZN15MemoryAllocator9mem_allocEm>:

void *MemoryAllocator::mem_alloc(uint64 size) {
    if(size <= 0) return nullptr;
    800028dc:	1a050063          	beqz	a0,80002a7c <_ZN15MemoryAllocator9mem_allocEm+0x1a0>
void *MemoryAllocator::mem_alloc(uint64 size) {
    800028e0:	fe010113          	addi	sp,sp,-32
    800028e4:	00113c23          	sd	ra,24(sp)
    800028e8:	00813823          	sd	s0,16(sp)
    800028ec:	00913423          	sd	s1,8(sp)
    800028f0:	02010413          	addi	s0,sp,32

    size *= MEM_BLOCK_SIZE;
    800028f4:	00651493          	slli	s1,a0,0x6

    if(!initialized) {
    800028f8:	00009797          	auipc	a5,0x9
    800028fc:	fa07c783          	lbu	a5,-96(a5) # 8000b898 <_ZN15MemoryAllocator11initializedE>
    80002900:	02078263          	beqz	a5,80002924 <_ZN15MemoryAllocator9mem_allocEm+0x48>
        initialize();
        initialized = true;
    }

    for(MemSegment *free = freeMemHead; free; free = free->next) {
    80002904:	00009717          	auipc	a4,0x9
    80002908:	f8473703          	ld	a4,-124(a4) # 8000b888 <_ZN15MemoryAllocator11freeMemHeadE>
    8000290c:	00070513          	mv	a0,a4
    80002910:	0e050863          	beqz	a0,80002a00 <_ZN15MemoryAllocator9mem_allocEm+0x124>
        if(free->size >= size) {
    80002914:	01053783          	ld	a5,16(a0)
    80002918:	0297f263          	bgeu	a5,s1,8000293c <_ZN15MemoryAllocator9mem_allocEm+0x60>
    for(MemSegment *free = freeMemHead; free; free = free->next) {
    8000291c:	00053503          	ld	a0,0(a0)
    80002920:	ff1ff06f          	j	80002910 <_ZN15MemoryAllocator9mem_allocEm+0x34>
        initialize();
    80002924:	00000097          	auipc	ra,0x0
    80002928:	f60080e7          	jalr	-160(ra) # 80002884 <_ZN15MemoryAllocator10initializeEv>
        initialized = true;
    8000292c:	00100793          	li	a5,1
    80002930:	00009717          	auipc	a4,0x9
    80002934:	f6f70423          	sb	a5,-152(a4) # 8000b898 <_ZN15MemoryAllocator11initializedE>
    80002938:	fcdff06f          	j	80002904 <_ZN15MemoryAllocator9mem_allocEm+0x28>
            //novi iskorisceni segment
            MemSegment *newUsed = free;

            //pokazivac se pomera pa moramo i sve podatke u strukturi da pomerimo
            uint64 s = free->size;
            MemSegment *n = free->next;
    8000293c:	00053683          	ld	a3,0(a0)
            MemSegment *p = free->prev;
    80002940:	00853603          	ld	a2,8(a0)
            if(s - size) {
    80002944:	04978c63          	beq	a5,s1,8000299c <_ZN15MemoryAllocator9mem_allocEm+0xc0>
                if(freeMemHead == free) freeMemHead = (MemSegment *)((char *)free + size);
    80002948:	04e50263          	beq	a0,a4,8000298c <_ZN15MemoryAllocator9mem_allocEm+0xb0>
                free = (MemSegment *)((char *)free + size);
    8000294c:	00950733          	add	a4,a0,s1
                free->size = s - size;
    80002950:	409787b3          	sub	a5,a5,s1
    80002954:	00f73823          	sd	a5,16(a4)
                free->next = n;
    80002958:	00d73023          	sd	a3,0(a4)
                free->prev = p;
    8000295c:	00c73423          	sd	a2,8(a4)
                if(free->next) free->next->prev = free;
    80002960:	00068463          	beqz	a3,80002968 <_ZN15MemoryAllocator9mem_allocEm+0x8c>
    80002964:	00e6b423          	sd	a4,8(a3)
                if(free->prev) free->prev->next = free;
    80002968:	00873783          	ld	a5,8(a4)
    8000296c:	00078463          	beqz	a5,80002974 <_ZN15MemoryAllocator9mem_allocEm+0x98>
    80002970:	00e7b023          	sd	a4,0(a5)
                    free->prev->next = free->next;
                    free->next->prev = free->prev;
                }
            }

            newUsed->size = size;
    80002974:	00953823          	sd	s1,16(a0)
            if(!usedMemHead) {
    80002978:	00009697          	auipc	a3,0x9
    8000297c:	f186b683          	ld	a3,-232(a3) # 8000b890 <_ZN15MemoryAllocator11usedMemHeadE>
    80002980:	06068263          	beqz	a3,800029e4 <_ZN15MemoryAllocator9mem_allocEm+0x108>
                usedMemHead = newUsed;
                usedMemHead->next = nullptr;
                usedMemHead->prev = nullptr;
            } else {
                //ulancavanje newUsed u listu
                for(MemSegment *used = usedMemHead; used; used = used->next) {
    80002984:	00068793          	mv	a5,a3
    80002988:	0940006f          	j	80002a1c <_ZN15MemoryAllocator9mem_allocEm+0x140>
                if(freeMemHead == free) freeMemHead = (MemSegment *)((char *)free + size);
    8000298c:	00950733          	add	a4,a0,s1
    80002990:	00009597          	auipc	a1,0x9
    80002994:	eee5bc23          	sd	a4,-264(a1) # 8000b888 <_ZN15MemoryAllocator11freeMemHeadE>
    80002998:	fb5ff06f          	j	8000294c <_ZN15MemoryAllocator9mem_allocEm+0x70>
                if (!free->prev && !free->next) {
    8000299c:	02060063          	beqz	a2,800029bc <_ZN15MemoryAllocator9mem_allocEm+0xe0>
                } else if(!free->prev) {
    800029a0:	02060663          	beqz	a2,800029cc <_ZN15MemoryAllocator9mem_allocEm+0xf0>
                } else if(!free->next) {
    800029a4:	02068c63          	beqz	a3,800029dc <_ZN15MemoryAllocator9mem_allocEm+0x100>
                    free->prev->next = free->next;
    800029a8:	00d63023          	sd	a3,0(a2)
                    free->next->prev = free->prev;
    800029ac:	00053783          	ld	a5,0(a0)
    800029b0:	00853703          	ld	a4,8(a0)
    800029b4:	00e7b423          	sd	a4,8(a5)
    800029b8:	fbdff06f          	j	80002974 <_ZN15MemoryAllocator9mem_allocEm+0x98>
                if (!free->prev && !free->next) {
    800029bc:	fe0692e3          	bnez	a3,800029a0 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
                    freeMemHead = nullptr;
    800029c0:	00009797          	auipc	a5,0x9
    800029c4:	ec07b423          	sd	zero,-312(a5) # 8000b888 <_ZN15MemoryAllocator11freeMemHeadE>
    800029c8:	fadff06f          	j	80002974 <_ZN15MemoryAllocator9mem_allocEm+0x98>
                    freeMemHead = free->next;
    800029cc:	00009797          	auipc	a5,0x9
    800029d0:	ead7be23          	sd	a3,-324(a5) # 8000b888 <_ZN15MemoryAllocator11freeMemHeadE>
                    freeMemHead->prev = nullptr;
    800029d4:	0006b423          	sd	zero,8(a3)
    800029d8:	f9dff06f          	j	80002974 <_ZN15MemoryAllocator9mem_allocEm+0x98>
                    free->prev->next = nullptr;
    800029dc:	00063023          	sd	zero,0(a2)
    800029e0:	f95ff06f          	j	80002974 <_ZN15MemoryAllocator9mem_allocEm+0x98>
                usedMemHead = newUsed;
    800029e4:	00009797          	auipc	a5,0x9
    800029e8:	ea478793          	addi	a5,a5,-348 # 8000b888 <_ZN15MemoryAllocator11freeMemHeadE>
    800029ec:	00a7b423          	sd	a0,8(a5)
                usedMemHead->next = nullptr;
    800029f0:	00053023          	sd	zero,0(a0)
                usedMemHead->prev = nullptr;
    800029f4:	0087b783          	ld	a5,8(a5)
    800029f8:	0007b423          	sd	zero,8(a5)
                        }
                        break;
                    }
                }
            }
            return (char *)newUsed + sizeof(MemoryAllocator::MemSegment);
    800029fc:	01850513          	addi	a0,a0,24
        }
    }
    return nullptr;
}
    80002a00:	01813083          	ld	ra,24(sp)
    80002a04:	01013403          	ld	s0,16(sp)
    80002a08:	00813483          	ld	s1,8(sp)
    80002a0c:	02010113          	addi	sp,sp,32
    80002a10:	00008067          	ret
                    } else if(used > newUsed) {
    80002a14:	02f56463          	bltu	a0,a5,80002a3c <_ZN15MemoryAllocator9mem_allocEm+0x160>
                for(MemSegment *used = usedMemHead; used; used = used->next) {
    80002a18:	00070793          	mv	a5,a4
    80002a1c:	fe0780e3          	beqz	a5,800029fc <_ZN15MemoryAllocator9mem_allocEm+0x120>
                    if(!used->next && used < newUsed) {
    80002a20:	0007b703          	ld	a4,0(a5)
    80002a24:	fe0718e3          	bnez	a4,80002a14 <_ZN15MemoryAllocator9mem_allocEm+0x138>
    80002a28:	fea7f6e3          	bgeu	a5,a0,80002a14 <_ZN15MemoryAllocator9mem_allocEm+0x138>
                        used->next = newUsed;
    80002a2c:	00a7b023          	sd	a0,0(a5)
                        newUsed->prev = used;
    80002a30:	00f53423          	sd	a5,8(a0)
                        newUsed->next = nullptr;
    80002a34:	00053023          	sd	zero,0(a0)
                        break;
    80002a38:	fc5ff06f          	j	800029fc <_ZN15MemoryAllocator9mem_allocEm+0x120>
                        if(used == usedMemHead) {
    80002a3c:	02f68463          	beq	a3,a5,80002a64 <_ZN15MemoryAllocator9mem_allocEm+0x188>
                            newUsed->prev = used->prev;
    80002a40:	0087b703          	ld	a4,8(a5)
    80002a44:	00e53423          	sd	a4,8(a0)
                            newUsed->next = used;
    80002a48:	00f53023          	sd	a5,0(a0)
                            if(newUsed->prev) newUsed->prev->next = newUsed;
    80002a4c:	00070463          	beqz	a4,80002a54 <_ZN15MemoryAllocator9mem_allocEm+0x178>
    80002a50:	00a73023          	sd	a0,0(a4)
                            if(newUsed->next) newUsed->next->prev = newUsed;
    80002a54:	00053783          	ld	a5,0(a0)
    80002a58:	fa0782e3          	beqz	a5,800029fc <_ZN15MemoryAllocator9mem_allocEm+0x120>
    80002a5c:	00a7b423          	sd	a0,8(a5)
    80002a60:	f9dff06f          	j	800029fc <_ZN15MemoryAllocator9mem_allocEm+0x120>
                            newUsed->prev = nullptr;
    80002a64:	00053423          	sd	zero,8(a0)
                            newUsed->next = used;
    80002a68:	00f53023          	sd	a5,0(a0)
                            used->prev = newUsed;
    80002a6c:	00a7b423          	sd	a0,8(a5)
                            usedMemHead = newUsed;
    80002a70:	00009797          	auipc	a5,0x9
    80002a74:	e2a7b023          	sd	a0,-480(a5) # 8000b890 <_ZN15MemoryAllocator11usedMemHeadE>
    80002a78:	f85ff06f          	j	800029fc <_ZN15MemoryAllocator9mem_allocEm+0x120>
    if(size <= 0) return nullptr;
    80002a7c:	00000513          	li	a0,0
}
    80002a80:	00008067          	ret

0000000080002a84 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void *adress) {
    80002a84:	ff010113          	addi	sp,sp,-16
    80002a88:	00813423          	sd	s0,8(sp)
    80002a8c:	01010413          	addi	s0,sp,16
    if(!adress) return -1;
    80002a90:	1a050263          	beqz	a0,80002c34 <_ZN15MemoryAllocator8mem_freeEPv+0x1b0>
    adress = (char *)adress - sizeof(MemoryAllocator::MemSegment);
    80002a94:	fe850513          	addi	a0,a0,-24

    for(MemSegment *used = usedMemHead; used; used = used->next) {
    80002a98:	00009797          	auipc	a5,0x9
    80002a9c:	df87b783          	ld	a5,-520(a5) # 8000b890 <_ZN15MemoryAllocator11usedMemHeadE>
    80002aa0:	1500006f          	j	80002bf0 <_ZN15MemoryAllocator8mem_freeEPv+0x16c>
        if(used == adress) {
            //novi slobodan segment
            MemSegment *newFree = used;

            //izbaciti used iz liste
            if (!used->prev && !used->next) {
    80002aa4:	0007b683          	ld	a3,0(a5)
    80002aa8:	14069c63          	bnez	a3,80002c00 <_ZN15MemoryAllocator8mem_freeEPv+0x17c>
                usedMemHead = nullptr;
    80002aac:	00009717          	auipc	a4,0x9
    80002ab0:	de073223          	sd	zero,-540(a4) # 8000b890 <_ZN15MemoryAllocator11usedMemHeadE>
    80002ab4:	1700006f          	j	80002c24 <_ZN15MemoryAllocator8mem_freeEPv+0x1a0>
            } else if(!used->prev) {
                usedMemHead = used->next;
    80002ab8:	0007b703          	ld	a4,0(a5)
    80002abc:	00009697          	auipc	a3,0x9
    80002ac0:	dce6ba23          	sd	a4,-556(a3) # 8000b890 <_ZN15MemoryAllocator11usedMemHeadE>
                usedMemHead->prev = nullptr;
    80002ac4:	00073423          	sd	zero,8(a4)
                used->next = nullptr;
    80002ac8:	0007b023          	sd	zero,0(a5)
    80002acc:	1580006f          	j	80002c24 <_ZN15MemoryAllocator8mem_freeEPv+0x1a0>
            } else if(!used->next) {
                used->prev->next = nullptr;
    80002ad0:	00073023          	sd	zero,0(a4)
                used->prev = nullptr;
    80002ad4:	0007b423          	sd	zero,8(a5)
    80002ad8:	14c0006f          	j	80002c24 <_ZN15MemoryAllocator8mem_freeEPv+0x1a0>
                used->prev = nullptr;
                used->next = nullptr;
            }

            //ulancavanje newFree u listu
            for(MemSegment *free = freeMemHead; free; free = free->next) {
    80002adc:	00068713          	mv	a4,a3
    80002ae0:	10070663          	beqz	a4,80002bec <_ZN15MemoryAllocator8mem_freeEPv+0x168>
                if(free > newFree) {
    80002ae4:	02e7ea63          	bltu	a5,a4,80002b18 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
                            cur->next = cur->next->next;
                            if(cur->next) cur->next->prev = cur;
                        }
                    }
                    return 0;
                } else if(!free->next) {
    80002ae8:	00073683          	ld	a3,0(a4)
    80002aec:	fe0698e3          	bnez	a3,80002adc <_ZN15MemoryAllocator8mem_freeEPv+0x58>
                    //dodavanje na kraj liste
                    free->next = newFree;
    80002af0:	00f73023          	sd	a5,0(a4)
                    newFree->prev = free;
    80002af4:	00e7b423          	sd	a4,8(a5)
                    newFree->next = nullptr;
    80002af8:	0007b023          	sd	zero,0(a5)

                    //spajanje slobodnih segmenata
                    if(newFree->prev) {
                        MemSegment *cur = newFree->prev;
                        if (cur->next && (char *) cur + cur->size == (char *) cur->next) {
    80002afc:	00073783          	ld	a5,0(a4)
    80002b00:	00078863          	beqz	a5,80002b10 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
    80002b04:	01073683          	ld	a3,16(a4)
    80002b08:	00d70633          	add	a2,a4,a3
    80002b0c:	0cc78063          	beq	a5,a2,80002bcc <_ZN15MemoryAllocator8mem_freeEPv+0x148>
                            cur->size += cur->next->size;
                            cur->next = cur->next->next;
                            if (cur->next) cur->next->prev = cur;
                        }
                    }
                    return 0;
    80002b10:	00000513          	li	a0,0
    80002b14:	0540006f          	j	80002b68 <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
                    if(free == freeMemHead) {
    80002b18:	04c70e63          	beq	a4,a2,80002b74 <_ZN15MemoryAllocator8mem_freeEPv+0xf0>
                        newFree->prev = free->prev;
    80002b1c:	00873683          	ld	a3,8(a4)
    80002b20:	00d7b423          	sd	a3,8(a5)
                        newFree->next = free;
    80002b24:	00e7b023          	sd	a4,0(a5)
                        newFree->prev->next = newFree;
    80002b28:	00f6b023          	sd	a5,0(a3)
                        newFree->next->prev = newFree;
    80002b2c:	0007b703          	ld	a4,0(a5)
    80002b30:	00f73423          	sd	a5,8(a4)
                    if(cur->next && (char *)cur + cur->size == (char *)cur->next) {
    80002b34:	0007b703          	ld	a4,0(a5)
    80002b38:	00070863          	beqz	a4,80002b48 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
    80002b3c:	0107b683          	ld	a3,16(a5)
    80002b40:	00d78633          	add	a2,a5,a3
    80002b44:	04c70463          	beq	a4,a2,80002b8c <_ZN15MemoryAllocator8mem_freeEPv+0x108>
                    if(newFree->prev) {
    80002b48:	0087b783          	ld	a5,8(a5)
    80002b4c:	00078c63          	beqz	a5,80002b64 <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
                        if(cur->next && (char *)cur + cur->size == (char *)cur->next) {
    80002b50:	0007b703          	ld	a4,0(a5)
    80002b54:	00070863          	beqz	a4,80002b64 <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
    80002b58:	0107b683          	ld	a3,16(a5)
    80002b5c:	00d78633          	add	a2,a5,a3
    80002b60:	04c70663          	beq	a4,a2,80002bac <_ZN15MemoryAllocator8mem_freeEPv+0x128>
                    return 0;
    80002b64:	00000513          	li	a0,0
            }
        }
    }

    return -1;
}
    80002b68:	00813403          	ld	s0,8(sp)
    80002b6c:	01010113          	addi	sp,sp,16
    80002b70:	00008067          	ret
                        newFree->prev = nullptr;
    80002b74:	0007b423          	sd	zero,8(a5)
                        newFree->next = free;
    80002b78:	00e7b023          	sd	a4,0(a5)
                        free->prev = newFree;
    80002b7c:	00f73423          	sd	a5,8(a4)
                        freeMemHead = newFree;
    80002b80:	00009717          	auipc	a4,0x9
    80002b84:	d0f73423          	sd	a5,-760(a4) # 8000b888 <_ZN15MemoryAllocator11freeMemHeadE>
    80002b88:	fadff06f          	j	80002b34 <_ZN15MemoryAllocator8mem_freeEPv+0xb0>
                        cur->size += cur->next->size;
    80002b8c:	01073603          	ld	a2,16(a4)
    80002b90:	00c686b3          	add	a3,a3,a2
    80002b94:	00d7b823          	sd	a3,16(a5)
                        cur->next = cur->next->next;
    80002b98:	00073703          	ld	a4,0(a4)
    80002b9c:	00e7b023          	sd	a4,0(a5)
                        if(cur->next) cur->next->prev = cur;
    80002ba0:	fa0704e3          	beqz	a4,80002b48 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
    80002ba4:	00f73423          	sd	a5,8(a4)
    80002ba8:	fa1ff06f          	j	80002b48 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
                            cur->size += cur->next->size;
    80002bac:	01073603          	ld	a2,16(a4)
    80002bb0:	00c686b3          	add	a3,a3,a2
    80002bb4:	00d7b823          	sd	a3,16(a5)
                            cur->next = cur->next->next;
    80002bb8:	00073703          	ld	a4,0(a4)
    80002bbc:	00e7b023          	sd	a4,0(a5)
                            if(cur->next) cur->next->prev = cur;
    80002bc0:	fa0702e3          	beqz	a4,80002b64 <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
    80002bc4:	00f73423          	sd	a5,8(a4)
    80002bc8:	f9dff06f          	j	80002b64 <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
                            cur->size += cur->next->size;
    80002bcc:	0107b603          	ld	a2,16(a5)
    80002bd0:	00c686b3          	add	a3,a3,a2
    80002bd4:	00d73823          	sd	a3,16(a4)
                            cur->next = cur->next->next;
    80002bd8:	0007b783          	ld	a5,0(a5)
    80002bdc:	00f73023          	sd	a5,0(a4)
                            if (cur->next) cur->next->prev = cur;
    80002be0:	f20788e3          	beqz	a5,80002b10 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
    80002be4:	00e7b423          	sd	a4,8(a5)
    80002be8:	f29ff06f          	j	80002b10 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
    for(MemSegment *used = usedMemHead; used; used = used->next) {
    80002bec:	0007b783          	ld	a5,0(a5)
    80002bf0:	04078663          	beqz	a5,80002c3c <_ZN15MemoryAllocator8mem_freeEPv+0x1b8>
        if(used == adress) {
    80002bf4:	fea79ce3          	bne	a5,a0,80002bec <_ZN15MemoryAllocator8mem_freeEPv+0x168>
            if (!used->prev && !used->next) {
    80002bf8:	0087b703          	ld	a4,8(a5)
    80002bfc:	ea0704e3          	beqz	a4,80002aa4 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
            } else if(!used->prev) {
    80002c00:	ea070ce3          	beqz	a4,80002ab8 <_ZN15MemoryAllocator8mem_freeEPv+0x34>
            } else if(!used->next) {
    80002c04:	0007b683          	ld	a3,0(a5)
    80002c08:	ec0684e3          	beqz	a3,80002ad0 <_ZN15MemoryAllocator8mem_freeEPv+0x4c>
                used->prev->next = used->next;
    80002c0c:	00d73023          	sd	a3,0(a4)
                used->next->prev = used->prev;
    80002c10:	0007b703          	ld	a4,0(a5)
    80002c14:	0087b683          	ld	a3,8(a5)
    80002c18:	00d73423          	sd	a3,8(a4)
                used->prev = nullptr;
    80002c1c:	0007b423          	sd	zero,8(a5)
                used->next = nullptr;
    80002c20:	0007b023          	sd	zero,0(a5)
            for(MemSegment *free = freeMemHead; free; free = free->next) {
    80002c24:	00009617          	auipc	a2,0x9
    80002c28:	c6463603          	ld	a2,-924(a2) # 8000b888 <_ZN15MemoryAllocator11freeMemHeadE>
    80002c2c:	00060713          	mv	a4,a2
    80002c30:	eb1ff06f          	j	80002ae0 <_ZN15MemoryAllocator8mem_freeEPv+0x5c>
    if(!adress) return -1;
    80002c34:	fff00513          	li	a0,-1
    80002c38:	f31ff06f          	j	80002b68 <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
    return -1;
    80002c3c:	fff00513          	li	a0,-1
    80002c40:	f29ff06f          	j	80002b68 <_ZN15MemoryAllocator8mem_freeEPv+0xe4>

0000000080002c44 <_ZN4Cons10initializeEv>:
Sem *Cons::itemAvailableI;
Sem *Cons::itemAvailableO;
Sem *Cons::mutexI;
Sem *Cons::mutexO;

void Cons::initialize() {
    80002c44:	ff010113          	addi	sp,sp,-16
    80002c48:	00113423          	sd	ra,8(sp)
    80002c4c:	00813023          	sd	s0,0(sp)
    80002c50:	01010413          	addi	s0,sp,16
    sem_open(&Cons::itemAvailableI, 0);
    80002c54:	00000593          	li	a1,0
    80002c58:	00009517          	auipc	a0,0x9
    80002c5c:	c4850513          	addi	a0,a0,-952 # 8000b8a0 <_ZN4Cons14itemAvailableIE>
    80002c60:	fffff097          	auipc	ra,0xfffff
    80002c64:	9d0080e7          	jalr	-1584(ra) # 80001630 <_Z8sem_openPP3Semj>
    sem_open(&Cons::itemAvailableO, 0);
    80002c68:	00000593          	li	a1,0
    80002c6c:	00009517          	auipc	a0,0x9
    80002c70:	c3c50513          	addi	a0,a0,-964 # 8000b8a8 <_ZN4Cons14itemAvailableOE>
    80002c74:	fffff097          	auipc	ra,0xfffff
    80002c78:	9bc080e7          	jalr	-1604(ra) # 80001630 <_Z8sem_openPP3Semj>
    sem_open(&Cons::mutexI, 1);
    80002c7c:	00100593          	li	a1,1
    80002c80:	00009517          	auipc	a0,0x9
    80002c84:	c3050513          	addi	a0,a0,-976 # 8000b8b0 <_ZN4Cons6mutexIE>
    80002c88:	fffff097          	auipc	ra,0xfffff
    80002c8c:	9a8080e7          	jalr	-1624(ra) # 80001630 <_Z8sem_openPP3Semj>
    sem_open(&Cons::mutexO, 1);
    80002c90:	00100593          	li	a1,1
    80002c94:	00009517          	auipc	a0,0x9
    80002c98:	c2450513          	addi	a0,a0,-988 # 8000b8b8 <_ZN4Cons6mutexOE>
    80002c9c:	fffff097          	auipc	ra,0xfffff
    80002ca0:	994080e7          	jalr	-1644(ra) # 80001630 <_Z8sem_openPP3Semj>
}
    80002ca4:	00813083          	ld	ra,8(sp)
    80002ca8:	00013403          	ld	s0,0(sp)
    80002cac:	01010113          	addi	sp,sp,16
    80002cb0:	00008067          	ret

0000000080002cb4 <_ZN4Cons4destEv>:

void Cons::dest() {
    80002cb4:	fe010113          	addi	sp,sp,-32
    80002cb8:	00113c23          	sd	ra,24(sp)
    80002cbc:	00813823          	sd	s0,16(sp)
    80002cc0:	00913423          	sd	s1,8(sp)
    80002cc4:	02010413          	addi	s0,sp,32
    sem_close(Cons::itemAvailableI);
    80002cc8:	00009497          	auipc	s1,0x9
    80002ccc:	bd848493          	addi	s1,s1,-1064 # 8000b8a0 <_ZN4Cons14itemAvailableIE>
    80002cd0:	0004b503          	ld	a0,0(s1)
    80002cd4:	fffff097          	auipc	ra,0xfffff
    80002cd8:	998080e7          	jalr	-1640(ra) # 8000166c <_Z9sem_closeP3Sem>
    sem_close(Cons::itemAvailableO);
    80002cdc:	0084b503          	ld	a0,8(s1)
    80002ce0:	fffff097          	auipc	ra,0xfffff
    80002ce4:	98c080e7          	jalr	-1652(ra) # 8000166c <_Z9sem_closeP3Sem>
    sem_close(Cons::mutexI);
    80002ce8:	0104b503          	ld	a0,16(s1)
    80002cec:	fffff097          	auipc	ra,0xfffff
    80002cf0:	980080e7          	jalr	-1664(ra) # 8000166c <_Z9sem_closeP3Sem>
    sem_close(Cons::mutexO);
    80002cf4:	0184b503          	ld	a0,24(s1)
    80002cf8:	fffff097          	auipc	ra,0xfffff
    80002cfc:	974080e7          	jalr	-1676(ra) # 8000166c <_Z9sem_closeP3Sem>
}
    80002d00:	01813083          	ld	ra,24(sp)
    80002d04:	01013403          	ld	s0,16(sp)
    80002d08:	00813483          	ld	s1,8(sp)
    80002d0c:	02010113          	addi	sp,sp,32
    80002d10:	00008067          	ret

0000000080002d14 <_ZN4Cons5getcIEv>:


char Cons::getcI() {
    80002d14:	fe010113          	addi	sp,sp,-32
    80002d18:	00113c23          	sd	ra,24(sp)
    80002d1c:	00813823          	sd	s0,16(sp)
    80002d20:	00913423          	sd	s1,8(sp)
    80002d24:	01213023          	sd	s2,0(sp)
    80002d28:	02010413          	addi	s0,sp,32
    if(!initialized) {
    80002d2c:	00009797          	auipc	a5,0x9
    80002d30:	b947c783          	lbu	a5,-1132(a5) # 8000b8c0 <_ZN4Cons11initializedE>
    80002d34:	06078a63          	beqz	a5,80002da8 <_ZN4Cons5getcIEv+0x94>
        initialize();
        initialized = true;
    }
    Sem::semWait(Cons::itemAvailableI);
    80002d38:	00009497          	auipc	s1,0x9
    80002d3c:	b6848493          	addi	s1,s1,-1176 # 8000b8a0 <_ZN4Cons14itemAvailableIE>
    80002d40:	0004b503          	ld	a0,0(s1)
    80002d44:	fffff097          	auipc	ra,0xfffff
    80002d48:	b50080e7          	jalr	-1200(ra) # 80001894 <_ZN3Sem7semWaitEPS_>
    Sem::semWait(Cons::mutexI);
    80002d4c:	0104b503          	ld	a0,16(s1)
    80002d50:	fffff097          	auipc	ra,0xfffff
    80002d54:	b44080e7          	jalr	-1212(ra) # 80001894 <_ZN3Sem7semWaitEPS_>
    char c = inputBuffer[headI];
    80002d58:	0284b783          	ld	a5,40(s1)
    80002d5c:	00f48733          	add	a4,s1,a5
    80002d60:	03074903          	lbu	s2,48(a4)
    headI = (headI + 1) % bufferSize;
    80002d64:	00178793          	addi	a5,a5,1
    80002d68:	3e800713          	li	a4,1000
    80002d6c:	02e7f7b3          	remu	a5,a5,a4
    80002d70:	02f4b423          	sd	a5,40(s1)
    countI--;
    80002d74:	4184b783          	ld	a5,1048(s1)
    80002d78:	fff78793          	addi	a5,a5,-1
    80002d7c:	40f4bc23          	sd	a5,1048(s1)
    Sem::semSignal(Cons::mutexI);
    80002d80:	0104b503          	ld	a0,16(s1)
    80002d84:	fffff097          	auipc	ra,0xfffff
    80002d88:	c00080e7          	jalr	-1024(ra) # 80001984 <_ZN3Sem9semSignalEPS_>
    return c;
}
    80002d8c:	00090513          	mv	a0,s2
    80002d90:	01813083          	ld	ra,24(sp)
    80002d94:	01013403          	ld	s0,16(sp)
    80002d98:	00813483          	ld	s1,8(sp)
    80002d9c:	00013903          	ld	s2,0(sp)
    80002da0:	02010113          	addi	sp,sp,32
    80002da4:	00008067          	ret
        initialize();
    80002da8:	00000097          	auipc	ra,0x0
    80002dac:	e9c080e7          	jalr	-356(ra) # 80002c44 <_ZN4Cons10initializeEv>
        initialized = true;
    80002db0:	00100793          	li	a5,1
    80002db4:	00009717          	auipc	a4,0x9
    80002db8:	b0f70623          	sb	a5,-1268(a4) # 8000b8c0 <_ZN4Cons11initializedE>
    80002dbc:	f7dff06f          	j	80002d38 <_ZN4Cons5getcIEv+0x24>

0000000080002dc0 <_ZN4Cons5putcIEc>:

void Cons::putcI(char c) {
    80002dc0:	fe010113          	addi	sp,sp,-32
    80002dc4:	00113c23          	sd	ra,24(sp)
    80002dc8:	00813823          	sd	s0,16(sp)
    80002dcc:	00913423          	sd	s1,8(sp)
    80002dd0:	01213023          	sd	s2,0(sp)
    80002dd4:	02010413          	addi	s0,sp,32
    80002dd8:	00050493          	mv	s1,a0
    if(!initialized) {
    80002ddc:	00009797          	auipc	a5,0x9
    80002de0:	ae47c783          	lbu	a5,-1308(a5) # 8000b8c0 <_ZN4Cons11initializedE>
    80002de4:	04078663          	beqz	a5,80002e30 <_ZN4Cons5putcIEc+0x70>
        initialize();
        initialized = true;
    }
    Sem::semWait(Cons::mutexI);
    80002de8:	00009917          	auipc	s2,0x9
    80002dec:	ab890913          	addi	s2,s2,-1352 # 8000b8a0 <_ZN4Cons14itemAvailableIE>
    80002df0:	01093503          	ld	a0,16(s2)
    80002df4:	fffff097          	auipc	ra,0xfffff
    80002df8:	aa0080e7          	jalr	-1376(ra) # 80001894 <_ZN3Sem7semWaitEPS_>
    if (countI < bufferSize) {
    80002dfc:	41893783          	ld	a5,1048(s2)
    80002e00:	3e700713          	li	a4,999
    80002e04:	04f77263          	bgeu	a4,a5,80002e48 <_ZN4Cons5putcIEc+0x88>
        inputBuffer[tailI] = c;
        tailI = (tailI + 1) % bufferSize;
        countI++;
        Sem::semSignal(Cons::itemAvailableI);
    }
    Sem::semSignal(Cons::mutexI);
    80002e08:	00009517          	auipc	a0,0x9
    80002e0c:	aa853503          	ld	a0,-1368(a0) # 8000b8b0 <_ZN4Cons6mutexIE>
    80002e10:	fffff097          	auipc	ra,0xfffff
    80002e14:	b74080e7          	jalr	-1164(ra) # 80001984 <_ZN3Sem9semSignalEPS_>
}
    80002e18:	01813083          	ld	ra,24(sp)
    80002e1c:	01013403          	ld	s0,16(sp)
    80002e20:	00813483          	ld	s1,8(sp)
    80002e24:	00013903          	ld	s2,0(sp)
    80002e28:	02010113          	addi	sp,sp,32
    80002e2c:	00008067          	ret
        initialize();
    80002e30:	00000097          	auipc	ra,0x0
    80002e34:	e14080e7          	jalr	-492(ra) # 80002c44 <_ZN4Cons10initializeEv>
        initialized = true;
    80002e38:	00100793          	li	a5,1
    80002e3c:	00009717          	auipc	a4,0x9
    80002e40:	a8f70223          	sb	a5,-1404(a4) # 8000b8c0 <_ZN4Cons11initializedE>
    80002e44:	fa5ff06f          	j	80002de8 <_ZN4Cons5putcIEc+0x28>
        inputBuffer[tailI] = c;
    80002e48:	42093703          	ld	a4,1056(s2)
    80002e4c:	00e90633          	add	a2,s2,a4
    80002e50:	02960823          	sb	s1,48(a2)
        tailI = (tailI + 1) % bufferSize;
    80002e54:	00170713          	addi	a4,a4,1
    80002e58:	3e800613          	li	a2,1000
    80002e5c:	02c77733          	remu	a4,a4,a2
    80002e60:	42e93023          	sd	a4,1056(s2)
        countI++;
    80002e64:	00178793          	addi	a5,a5,1
    80002e68:	40f93c23          	sd	a5,1048(s2)
        Sem::semSignal(Cons::itemAvailableI);
    80002e6c:	00093503          	ld	a0,0(s2)
    80002e70:	fffff097          	auipc	ra,0xfffff
    80002e74:	b14080e7          	jalr	-1260(ra) # 80001984 <_ZN3Sem9semSignalEPS_>
    80002e78:	f91ff06f          	j	80002e08 <_ZN4Cons5putcIEc+0x48>

0000000080002e7c <_ZN4Cons5getcOEv>:

char Cons::getcO() {
    80002e7c:	fe010113          	addi	sp,sp,-32
    80002e80:	00113c23          	sd	ra,24(sp)
    80002e84:	00813823          	sd	s0,16(sp)
    80002e88:	00913423          	sd	s1,8(sp)
    80002e8c:	01213023          	sd	s2,0(sp)
    80002e90:	02010413          	addi	s0,sp,32
    if(!initialized) {
    80002e94:	00009797          	auipc	a5,0x9
    80002e98:	a2c7c783          	lbu	a5,-1492(a5) # 8000b8c0 <_ZN4Cons11initializedE>
    80002e9c:	06078e63          	beqz	a5,80002f18 <_ZN4Cons5getcOEv+0x9c>
        initialize();
        initialized = true;
    }
    Sem::semWait(Cons::itemAvailableO);
    80002ea0:	00009497          	auipc	s1,0x9
    80002ea4:	a0048493          	addi	s1,s1,-1536 # 8000b8a0 <_ZN4Cons14itemAvailableIE>
    80002ea8:	0084b503          	ld	a0,8(s1)
    80002eac:	fffff097          	auipc	ra,0xfffff
    80002eb0:	9e8080e7          	jalr	-1560(ra) # 80001894 <_ZN3Sem7semWaitEPS_>
    Sem::semWait(Cons::mutexO);
    80002eb4:	0184b503          	ld	a0,24(s1)
    80002eb8:	fffff097          	auipc	ra,0xfffff
    80002ebc:	9dc080e7          	jalr	-1572(ra) # 80001894 <_ZN3Sem7semWaitEPS_>
    char c = outputBuffer[headO];
    80002ec0:	4284b783          	ld	a5,1064(s1)
    80002ec4:	00f48733          	add	a4,s1,a5
    80002ec8:	43074903          	lbu	s2,1072(a4)
    headO = (headO + 1) % bufferSize;
    80002ecc:	00178793          	addi	a5,a5,1
    80002ed0:	3e800713          	li	a4,1000
    80002ed4:	02e7f7b3          	remu	a5,a5,a4
    80002ed8:	42f4b423          	sd	a5,1064(s1)
    countO--;
    80002edc:	0000a717          	auipc	a4,0xa
    80002ee0:	9c470713          	addi	a4,a4,-1596 # 8000c8a0 <stack0+0x750>
    80002ee4:	81873783          	ld	a5,-2024(a4)
    80002ee8:	fff78793          	addi	a5,a5,-1
    80002eec:	80f73c23          	sd	a5,-2024(a4)
    Sem::semSignal(Cons::mutexO);
    80002ef0:	0184b503          	ld	a0,24(s1)
    80002ef4:	fffff097          	auipc	ra,0xfffff
    80002ef8:	a90080e7          	jalr	-1392(ra) # 80001984 <_ZN3Sem9semSignalEPS_>
    return c;
}
    80002efc:	00090513          	mv	a0,s2
    80002f00:	01813083          	ld	ra,24(sp)
    80002f04:	01013403          	ld	s0,16(sp)
    80002f08:	00813483          	ld	s1,8(sp)
    80002f0c:	00013903          	ld	s2,0(sp)
    80002f10:	02010113          	addi	sp,sp,32
    80002f14:	00008067          	ret
        initialize();
    80002f18:	00000097          	auipc	ra,0x0
    80002f1c:	d2c080e7          	jalr	-724(ra) # 80002c44 <_ZN4Cons10initializeEv>
        initialized = true;
    80002f20:	00100793          	li	a5,1
    80002f24:	00009717          	auipc	a4,0x9
    80002f28:	98f70e23          	sb	a5,-1636(a4) # 8000b8c0 <_ZN4Cons11initializedE>
    80002f2c:	f75ff06f          	j	80002ea0 <_ZN4Cons5getcOEv+0x24>

0000000080002f30 <_ZN4Cons5putcOEc>:

void Cons::putcO(char c) {
    80002f30:	fe010113          	addi	sp,sp,-32
    80002f34:	00113c23          	sd	ra,24(sp)
    80002f38:	00813823          	sd	s0,16(sp)
    80002f3c:	00913423          	sd	s1,8(sp)
    80002f40:	02010413          	addi	s0,sp,32
    80002f44:	00050493          	mv	s1,a0
    if(!initialized) {
    80002f48:	00009797          	auipc	a5,0x9
    80002f4c:	9787c783          	lbu	a5,-1672(a5) # 8000b8c0 <_ZN4Cons11initializedE>
    80002f50:	04078463          	beqz	a5,80002f98 <_ZN4Cons5putcOEc+0x68>
        initialize();
        initialized = true;
    }
    Sem::semWait(Cons::mutexO);
    80002f54:	00009517          	auipc	a0,0x9
    80002f58:	96453503          	ld	a0,-1692(a0) # 8000b8b8 <_ZN4Cons6mutexOE>
    80002f5c:	fffff097          	auipc	ra,0xfffff
    80002f60:	938080e7          	jalr	-1736(ra) # 80001894 <_ZN3Sem7semWaitEPS_>
    if (countO < bufferSize) {
    80002f64:	00009797          	auipc	a5,0x9
    80002f68:	1547b783          	ld	a5,340(a5) # 8000c0b8 <_ZN4Cons6countOE>
    80002f6c:	3e700713          	li	a4,999
    80002f70:	04f77063          	bgeu	a4,a5,80002fb0 <_ZN4Cons5putcOEc+0x80>
        outputBuffer[tailO] = c;
        tailO = (tailO + 1) % bufferSize;
        countO++;
        Sem::semSignal(Cons::itemAvailableO);
    }
    Sem::semSignal(Cons::mutexO);
    80002f74:	00009517          	auipc	a0,0x9
    80002f78:	94453503          	ld	a0,-1724(a0) # 8000b8b8 <_ZN4Cons6mutexOE>
    80002f7c:	fffff097          	auipc	ra,0xfffff
    80002f80:	a08080e7          	jalr	-1528(ra) # 80001984 <_ZN3Sem9semSignalEPS_>
    80002f84:	01813083          	ld	ra,24(sp)
    80002f88:	01013403          	ld	s0,16(sp)
    80002f8c:	00813483          	ld	s1,8(sp)
    80002f90:	02010113          	addi	sp,sp,32
    80002f94:	00008067          	ret
        initialize();
    80002f98:	00000097          	auipc	ra,0x0
    80002f9c:	cac080e7          	jalr	-852(ra) # 80002c44 <_ZN4Cons10initializeEv>
        initialized = true;
    80002fa0:	00100793          	li	a5,1
    80002fa4:	00009717          	auipc	a4,0x9
    80002fa8:	90f70e23          	sb	a5,-1764(a4) # 8000b8c0 <_ZN4Cons11initializedE>
    80002fac:	fa9ff06f          	j	80002f54 <_ZN4Cons5putcOEc+0x24>
        outputBuffer[tailO] = c;
    80002fb0:	0000a697          	auipc	a3,0xa
    80002fb4:	8f068693          	addi	a3,a3,-1808 # 8000c8a0 <stack0+0x750>
    80002fb8:	8206b703          	ld	a4,-2016(a3)
    80002fbc:	00009617          	auipc	a2,0x9
    80002fc0:	8e460613          	addi	a2,a2,-1820 # 8000b8a0 <_ZN4Cons14itemAvailableIE>
    80002fc4:	00e605b3          	add	a1,a2,a4
    80002fc8:	42958823          	sb	s1,1072(a1)
        tailO = (tailO + 1) % bufferSize;
    80002fcc:	00170713          	addi	a4,a4,1
    80002fd0:	3e800593          	li	a1,1000
    80002fd4:	02b77733          	remu	a4,a4,a1
    80002fd8:	82e6b023          	sd	a4,-2016(a3)
        countO++;
    80002fdc:	00178793          	addi	a5,a5,1
    80002fe0:	80f6bc23          	sd	a5,-2024(a3)
        Sem::semSignal(Cons::itemAvailableO);
    80002fe4:	00863503          	ld	a0,8(a2)
    80002fe8:	fffff097          	auipc	ra,0xfffff
    80002fec:	99c080e7          	jalr	-1636(ra) # 80001984 <_ZN3Sem9semSignalEPS_>
    80002ff0:	f85ff06f          	j	80002f74 <_ZN4Cons5putcOEc+0x44>

0000000080002ff4 <ecallHandleTrap>:
#include "../h/syscall_c.hpp"
#include "../test/printing.hpp"

extern "C" void trap();

extern "C" void ecallHandleTrap() {
    80002ff4:	fd010113          	addi	sp,sp,-48
    80002ff8:	02113423          	sd	ra,40(sp)
    80002ffc:	02813023          	sd	s0,32(sp)
    80003000:	03010413          	addi	s0,sp,48
    uint64 a0reg, a1reg, a2reg, a3reg, a4reg;
    __asm__ volatile("ld %0 , 10*8(fp)" : "=r" (a0reg));
    80003004:	05043803          	ld	a6,80(s0)
    __asm__ volatile("ld %0 , 11*8(fp)" : "=r" (a1reg));
    80003008:	05843503          	ld	a0,88(s0)
    __asm__ volatile("ld %0 , 12*8(fp)" : "=r" (a2reg));
    8000300c:	06043583          	ld	a1,96(s0)
    __asm__ volatile("ld %0 , 13*8(fp)" : "=r" (a3reg));
    80003010:	06843603          	ld	a2,104(s0)
    __asm__ volatile("ld %0 , 14*8(fp)" : "=r" (a4reg));
    80003014:	07043683          	ld	a3,112(s0)

    uint64 volatile scause;
    __asm__ volatile ("csrr %0, scause" : "=r" (scause));
    80003018:	142027f3          	csrr	a5,scause
    8000301c:	fef43423          	sd	a5,-24(s0)

    uint64 volatile sepc;
    __asm__ volatile ("csrr %0, sepc" : "=r" (sepc));
    80003020:	141027f3          	csrr	a5,sepc
    80003024:	fef43023          	sd	a5,-32(s0)

    uint64 volatile sstatus;
    __asm__ volatile ("csrr %0, sstatus" : "=r" (sstatus));
    80003028:	100027f3          	csrr	a5,sstatus
    8000302c:	fcf43c23          	sd	a5,-40(s0)

    if(scause == 0x0000000000000008UL || scause == 0x0000000000000009UL) {
    80003030:	fe843703          	ld	a4,-24(s0)
    80003034:	00800793          	li	a5,8
    80003038:	00f70863          	beq	a4,a5,80003048 <ecallHandleTrap+0x54>
    8000303c:	fe843703          	ld	a4,-24(s0)
    80003040:	00900793          	li	a5,9
    80003044:	02f71e63          	bne	a4,a5,80003080 <ecallHandleTrap+0x8c>
        sepc += 4;
    80003048:	fe043783          	ld	a5,-32(s0)
    8000304c:	00478793          	addi	a5,a5,4
    80003050:	fef43023          	sd	a5,-32(s0)
        uint64 volatile code = a0reg;
    80003054:	fd043823          	sd	a6,-48(s0)

        switch (code) {
    80003058:	fd043783          	ld	a5,-48(s0)
    8000305c:	04200713          	li	a4,66
    80003060:	02f76c63          	bltu	a4,a5,80003098 <ecallHandleTrap+0xa4>
    80003064:	00279793          	slli	a5,a5,0x2
    80003068:	00006717          	auipc	a4,0x6
    8000306c:	fb870713          	addi	a4,a4,-72 # 80009020 <CONSOLE_STATUS+0x10>
    80003070:	00e787b3          	add	a5,a5,a4
    80003074:	0007a783          	lw	a5,0(a5)
    80003078:	00e787b3          	add	a5,a5,a4
    8000307c:	00078067          	jr	a5
                c2 = (char) a1reg;
                Cons::putcO(c2);
                break;
        }
    } else {
        printInt((int) scause);
    80003080:	fe843503          	ld	a0,-24(s0)
    80003084:	00000613          	li	a2,0
    80003088:	00a00593          	li	a1,10
    8000308c:	0005051b          	sext.w	a0,a0
    80003090:	00003097          	auipc	ra,0x3
    80003094:	8b8080e7          	jalr	-1864(ra) # 80005948 <_Z8printIntiii>
    }

    __asm__ volatile ("csrw sepc, %0" : : "r" (sepc));
    80003098:	fe043783          	ld	a5,-32(s0)
    8000309c:	14179073          	csrw	sepc,a5
    __asm__ volatile ("csrw sstatus, %0" : : "r" (sstatus));
    800030a0:	fd843783          	ld	a5,-40(s0)
    800030a4:	10079073          	csrw	sstatus,a5
}
    800030a8:	02813083          	ld	ra,40(sp)
    800030ac:	02013403          	ld	s0,32(sp)
    800030b0:	03010113          	addi	sp,sp,48
    800030b4:	00008067          	ret
                retAlloc = MemoryAllocator::mem_alloc(size);
    800030b8:	00000097          	auipc	ra,0x0
    800030bc:	824080e7          	jalr	-2012(ra) # 800028dc <_ZN15MemoryAllocator9mem_allocEm>
                __asm__ volatile("sd %0, 10*8(fp)" : : "r" (retAlloc));
    800030c0:	04a43823          	sd	a0,80(s0)
                break;
    800030c4:	fd5ff06f          	j	80003098 <ecallHandleTrap+0xa4>
                retFree = MemoryAllocator::mem_free(adress);
    800030c8:	00000097          	auipc	ra,0x0
    800030cc:	9bc080e7          	jalr	-1604(ra) # 80002a84 <_ZN15MemoryAllocator8mem_freeEPv>
                __asm__ volatile("sd %0, 10*8(fp)" : : "r" (retFree));
    800030d0:	04a43823          	sd	a0,80(s0)
                break;
    800030d4:	fc5ff06f          	j	80003098 <ecallHandleTrap+0xa4>
                retThreadCreate = TCB::createThread(handle, start_routine, arg, stack);
    800030d8:	fffff097          	auipc	ra,0xfffff
    800030dc:	3f4080e7          	jalr	1012(ra) # 800024cc <_ZN3TCB12createThreadEPPS_PFvPvES2_S2_>
                __asm__ volatile("sd %0, 10*8(fp)" : : "r" (retThreadCreate));
    800030e0:	04a43823          	sd	a0,80(s0)
                break;
    800030e4:	fb5ff06f          	j	80003098 <ecallHandleTrap+0xa4>
                if (TCB::running->isFinished()) retThreadExit = -1;
    800030e8:	00008797          	auipc	a5,0x8
    800030ec:	7107b783          	ld	a5,1808(a5) # 8000b7f8 <_GLOBAL_OFFSET_TABLE_+0x40>
    800030f0:	0007b503          	ld	a0,0(a5)
    bool isFinished() const { return finished; }
    800030f4:	02854783          	lbu	a5,40(a0)
    800030f8:	00078863          	beqz	a5,80003108 <ecallHandleTrap+0x114>
    800030fc:	fff00793          	li	a5,-1
                __asm__ volatile("sd %0, 10*8(fp)" : : "r" (retThreadExit));
    80003100:	04f43823          	sd	a5,80(s0)
                break;
    80003104:	f95ff06f          	j	80003098 <ecallHandleTrap+0xa4>
    void setFinished(bool f) { finished = f; }
    80003108:	00100793          	li	a5,1
    8000310c:	02f50423          	sb	a5,40(a0)
                    TCB::running->waitList();
    80003110:	fffff097          	auipc	ra,0xfffff
    80003114:	5b0080e7          	jalr	1456(ra) # 800026c0 <_ZN3TCB8waitListEv>
                    TCB::dispatch();
    80003118:	fffff097          	auipc	ra,0xfffff
    8000311c:	460080e7          	jalr	1120(ra) # 80002578 <_ZN3TCB8dispatchEv>
                    retThreadExit = 0;
    80003120:	00000793          	li	a5,0
    80003124:	fddff06f          	j	80003100 <ecallHandleTrap+0x10c>
                TCB::timeSliceCounter = 0;
    80003128:	00008797          	auipc	a5,0x8
    8000312c:	6b87b783          	ld	a5,1720(a5) # 8000b7e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003130:	0007b023          	sd	zero,0(a5)
                TCB::dispatch();
    80003134:	fffff097          	auipc	ra,0xfffff
    80003138:	444080e7          	jalr	1092(ra) # 80002578 <_ZN3TCB8dispatchEv>
                break;
    8000313c:	f5dff06f          	j	80003098 <ecallHandleTrap+0xa4>
                TCB::join(handle2);
    80003140:	fffff097          	auipc	ra,0xfffff
    80003144:	4f4080e7          	jalr	1268(ra) # 80002634 <_ZN3TCB4joinEPS_>
                break;
    80003148:	f51ff06f          	j	80003098 <ecallHandleTrap+0xa4>
                Sem::semOpen(handle3, init);
    8000314c:	0005859b          	sext.w	a1,a1
    80003150:	ffffe097          	auipc	ra,0xffffe
    80003154:	660080e7          	jalr	1632(ra) # 800017b0 <_ZN3Sem7semOpenEPPS_j>
                break;
    80003158:	f41ff06f          	j	80003098 <ecallHandleTrap+0xa4>
                Sem::semClose(handle4);
    8000315c:	ffffe097          	auipc	ra,0xffffe
    80003160:	7c4080e7          	jalr	1988(ra) # 80001920 <_ZN3Sem8semCloseEPS_>
                break;
    80003164:	f35ff06f          	j	80003098 <ecallHandleTrap+0xa4>
                Sem::semWait(id1);
    80003168:	ffffe097          	auipc	ra,0xffffe
    8000316c:	72c080e7          	jalr	1836(ra) # 80001894 <_ZN3Sem7semWaitEPS_>
                break;
    80003170:	f29ff06f          	j	80003098 <ecallHandleTrap+0xa4>
                Sem::semSignal(id2);
    80003174:	fffff097          	auipc	ra,0xfffff
    80003178:	810080e7          	jalr	-2032(ra) # 80001984 <_ZN3Sem9semSignalEPS_>
                break;
    8000317c:	f1dff06f          	j	80003098 <ecallHandleTrap+0xa4>
                TCB::timeSliceCounter = 0;
    80003180:	00008797          	auipc	a5,0x8
    80003184:	6607b783          	ld	a5,1632(a5) # 8000b7e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003188:	0007b023          	sd	zero,0(a5)
                retSleep = TCB::sleep(time);
    8000318c:	fffff097          	auipc	ra,0xfffff
    80003190:	5e4080e7          	jalr	1508(ra) # 80002770 <_ZN3TCB5sleepEm>
                __asm__ volatile("sd %0, 10*8(fp)" : : "r" (retSleep));
    80003194:	04a43823          	sd	a0,80(s0)
                break;
    80003198:	f01ff06f          	j	80003098 <ecallHandleTrap+0xa4>
                c1 = (char) Cons::getcI();
    8000319c:	00000097          	auipc	ra,0x0
    800031a0:	b78080e7          	jalr	-1160(ra) # 80002d14 <_ZN4Cons5getcIEv>
                __asm__ volatile("sd %0, 10*8(fp)" : : "r" (c1));
    800031a4:	04a43823          	sd	a0,80(s0)
                break;
    800031a8:	ef1ff06f          	j	80003098 <ecallHandleTrap+0xa4>
                Cons::putcO(c2);
    800031ac:	0ff57513          	andi	a0,a0,255
    800031b0:	00000097          	auipc	ra,0x0
    800031b4:	d80080e7          	jalr	-640(ra) # 80002f30 <_ZN4Cons5putcOEc>
                break;
    800031b8:	ee1ff06f          	j	80003098 <ecallHandleTrap+0xa4>

00000000800031bc <timerHandleTrap>:

extern "C" void timerHandleTrap() {
    800031bc:	fc010113          	addi	sp,sp,-64
    800031c0:	02113c23          	sd	ra,56(sp)
    800031c4:	02813823          	sd	s0,48(sp)
    800031c8:	02913423          	sd	s1,40(sp)
    800031cc:	04010413          	addi	s0,sp,64
    uint64 volatile scause;
    __asm__ volatile ("csrr %0, scause" : "=r" (scause));
    800031d0:	142027f3          	csrr	a5,scause
    800031d4:	fcf43c23          	sd	a5,-40(s0)

    uint64 volatile sepc;
    __asm__ volatile ("csrr %0, sepc" : "=r" (sepc));
    800031d8:	141027f3          	csrr	a5,sepc
    800031dc:	fcf43823          	sd	a5,-48(s0)

    uint64 volatile sstatus;
    __asm__ volatile ("csrr %0, sstatus" : "=r" (sstatus));
    800031e0:	100027f3          	csrr	a5,sstatus
    800031e4:	fcf43423          	sd	a5,-56(s0)

    if (scause == 0x8000000000000001UL) {
    800031e8:	fd843703          	ld	a4,-40(s0)
    800031ec:	fff00793          	li	a5,-1
    800031f0:	03f79793          	slli	a5,a5,0x3f
    800031f4:	00178793          	addi	a5,a5,1
    800031f8:	02f70463          	beq	a4,a5,80003220 <timerHandleTrap+0x64>
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
        }
    }

    __asm__ volatile ("csrw sepc, %0" : : "r" (sepc));
    800031fc:	fd043783          	ld	a5,-48(s0)
    80003200:	14179073          	csrw	sepc,a5
    __asm__ volatile ("csrw sstatus, %0" : : "r" (sstatus));
    80003204:	fc843783          	ld	a5,-56(s0)
    80003208:	10079073          	csrw	sstatus,a5
}
    8000320c:	03813083          	ld	ra,56(sp)
    80003210:	03013403          	ld	s0,48(sp)
    80003214:	02813483          	ld	s1,40(sp)
    80003218:	04010113          	addi	sp,sp,64
    8000321c:	00008067          	ret
        __asm__ volatile ("csrc sip, %0" : : "r" (maskSSIP));
    80003220:	00200793          	li	a5,2
    80003224:	1447b073          	csrc	sip,a5
        TCB::timeSliceCounter++;
    80003228:	00008497          	auipc	s1,0x8
    8000322c:	5b84b483          	ld	s1,1464(s1) # 8000b7e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003230:	0004b783          	ld	a5,0(s1)
    80003234:	00178793          	addi	a5,a5,1
    80003238:	00f4b023          	sd	a5,0(s1)
        Sleeping::get();
    8000323c:	fffff097          	auipc	ra,0xfffff
    80003240:	04c080e7          	jalr	76(ra) # 80002288 <_ZN8Sleeping3getEv>
        if(TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    80003244:	00008797          	auipc	a5,0x8
    80003248:	5b47b783          	ld	a5,1460(a5) # 8000b7f8 <_GLOBAL_OFFSET_TABLE_+0x40>
    8000324c:	0007b783          	ld	a5,0(a5)
    uint64 getTimeSlice() const { return timeSlice; }
    80003250:	0307b783          	ld	a5,48(a5)
    80003254:	0004b703          	ld	a4,0(s1)
    80003258:	faf762e3          	bltu	a4,a5,800031fc <timerHandleTrap+0x40>
            TCB::timeSliceCounter = 0;
    8000325c:	0004b023          	sd	zero,0(s1)
            TCB::dispatch();
    80003260:	fffff097          	auipc	ra,0xfffff
    80003264:	318080e7          	jalr	792(ra) # 80002578 <_ZN3TCB8dispatchEv>
    80003268:	f95ff06f          	j	800031fc <timerHandleTrap+0x40>

000000008000326c <consoleHandleTrap>:

extern "C" void consoleHandleTrap() {
    8000326c:	fc010113          	addi	sp,sp,-64
    80003270:	02113c23          	sd	ra,56(sp)
    80003274:	02813823          	sd	s0,48(sp)
    80003278:	02913423          	sd	s1,40(sp)
    8000327c:	04010413          	addi	s0,sp,64
    uint64 volatile scause;
    __asm__ volatile ("csrr %0, scause" : "=r" (scause));
    80003280:	142027f3          	csrr	a5,scause
    80003284:	fcf43c23          	sd	a5,-40(s0)

    uint64 volatile sepc;
    __asm__ volatile ("csrr %0, sepc" : "=r" (sepc));
    80003288:	141027f3          	csrr	a5,sepc
    8000328c:	fcf43823          	sd	a5,-48(s0)

    uint64 volatile sstatus;
    __asm__ volatile ("csrr %0, sstatus" : "=r" (sstatus));
    80003290:	100027f3          	csrr	a5,sstatus
    80003294:	fcf43423          	sd	a5,-56(s0)

    if (scause == 0x8000000000000009UL) {
    80003298:	fd843703          	ld	a4,-40(s0)
    8000329c:	fff00793          	li	a5,-1
    800032a0:	03f79793          	slli	a5,a5,0x3f
    800032a4:	00978793          	addi	a5,a5,9
    800032a8:	02f70463          	beq	a4,a5,800032d0 <consoleHandleTrap+0x64>
            Cons::putcI(c);
        }
        plic_complete(interupt);
    }

    __asm__ volatile ("csrw sepc, %0" : : "r" (sepc));
    800032ac:	fd043783          	ld	a5,-48(s0)
    800032b0:	14179073          	csrw	sepc,a5
    __asm__ volatile ("csrw sstatus, %0" : : "r" (sstatus));
    800032b4:	fc843783          	ld	a5,-56(s0)
    800032b8:	10079073          	csrw	sstatus,a5
}
    800032bc:	03813083          	ld	ra,56(sp)
    800032c0:	03013403          	ld	s0,48(sp)
    800032c4:	02813483          	ld	s1,40(sp)
    800032c8:	04010113          	addi	sp,sp,64
    800032cc:	00008067          	ret
        int interupt = plic_claim();
    800032d0:	00004097          	auipc	ra,0x4
    800032d4:	f74080e7          	jalr	-140(ra) # 80007244 <plic_claim>
    800032d8:	00050493          	mv	s1,a0
        while(CONSOLE_RX_STATUS_BIT & *((char*)(CONSOLE_STATUS))) {
    800032dc:	00008797          	auipc	a5,0x8
    800032e0:	4ec7b783          	ld	a5,1260(a5) # 8000b7c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800032e4:	0007b783          	ld	a5,0(a5)
    800032e8:	0007c783          	lbu	a5,0(a5)
    800032ec:	0017f793          	andi	a5,a5,1
    800032f0:	02078063          	beqz	a5,80003310 <consoleHandleTrap+0xa4>
            char c = (*(char*) CONSOLE_RX_DATA);
    800032f4:	00008797          	auipc	a5,0x8
    800032f8:	4cc7b783          	ld	a5,1228(a5) # 8000b7c0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800032fc:	0007b783          	ld	a5,0(a5)
            Cons::putcI(c);
    80003300:	0007c503          	lbu	a0,0(a5)
    80003304:	00000097          	auipc	ra,0x0
    80003308:	abc080e7          	jalr	-1348(ra) # 80002dc0 <_ZN4Cons5putcIEc>
        while(CONSOLE_RX_STATUS_BIT & *((char*)(CONSOLE_STATUS))) {
    8000330c:	fd1ff06f          	j	800032dc <consoleHandleTrap+0x70>
        plic_complete(interupt);
    80003310:	00048513          	mv	a0,s1
    80003314:	00004097          	auipc	ra,0x4
    80003318:	f68080e7          	jalr	-152(ra) # 8000727c <plic_complete>
    8000331c:	f91ff06f          	j	800032ac <consoleHandleTrap+0x40>

0000000080003320 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003320:	fe010113          	addi	sp,sp,-32
    80003324:	00113c23          	sd	ra,24(sp)
    80003328:	00813823          	sd	s0,16(sp)
    8000332c:	00913423          	sd	s1,8(sp)
    80003330:	01213023          	sd	s2,0(sp)
    80003334:	02010413          	addi	s0,sp,32
    80003338:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000333c:	00000913          	li	s2,0
    80003340:	00c0006f          	j	8000334c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003344:	ffffe097          	auipc	ra,0xffffe
    80003348:	290080e7          	jalr	656(ra) # 800015d4 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    8000334c:	ffffe097          	auipc	ra,0xffffe
    80003350:	400080e7          	jalr	1024(ra) # 8000174c <_Z4getcv>
    80003354:	0005059b          	sext.w	a1,a0
    80003358:	01b00793          	li	a5,27
    8000335c:	02f58a63          	beq	a1,a5,80003390 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003360:	0084b503          	ld	a0,8(s1)
    80003364:	00003097          	auipc	ra,0x3
    80003368:	400080e7          	jalr	1024(ra) # 80006764 <_ZN6Buffer3putEi>
        i++;
    8000336c:	0019071b          	addiw	a4,s2,1
    80003370:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003374:	0004a683          	lw	a3,0(s1)
    80003378:	0026979b          	slliw	a5,a3,0x2
    8000337c:	00d787bb          	addw	a5,a5,a3
    80003380:	0017979b          	slliw	a5,a5,0x1
    80003384:	02f767bb          	remw	a5,a4,a5
    80003388:	fc0792e3          	bnez	a5,8000334c <_ZL16producerKeyboardPv+0x2c>
    8000338c:	fb9ff06f          	j	80003344 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003390:	00100793          	li	a5,1
    80003394:	00009717          	auipc	a4,0x9
    80003398:	d2f72a23          	sw	a5,-716(a4) # 8000c0c8 <_ZL9threadEnd>
    data->buffer->put('!');
    8000339c:	02100593          	li	a1,33
    800033a0:	0084b503          	ld	a0,8(s1)
    800033a4:	00003097          	auipc	ra,0x3
    800033a8:	3c0080e7          	jalr	960(ra) # 80006764 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800033ac:	0104b503          	ld	a0,16(s1)
    800033b0:	ffffe097          	auipc	ra,0xffffe
    800033b4:	32c080e7          	jalr	812(ra) # 800016dc <_Z10sem_signalP3Sem>
}
    800033b8:	01813083          	ld	ra,24(sp)
    800033bc:	01013403          	ld	s0,16(sp)
    800033c0:	00813483          	ld	s1,8(sp)
    800033c4:	00013903          	ld	s2,0(sp)
    800033c8:	02010113          	addi	sp,sp,32
    800033cc:	00008067          	ret

00000000800033d0 <_ZL8producerPv>:

static void producer(void *arg) {
    800033d0:	fe010113          	addi	sp,sp,-32
    800033d4:	00113c23          	sd	ra,24(sp)
    800033d8:	00813823          	sd	s0,16(sp)
    800033dc:	00913423          	sd	s1,8(sp)
    800033e0:	01213023          	sd	s2,0(sp)
    800033e4:	02010413          	addi	s0,sp,32
    800033e8:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800033ec:	00000913          	li	s2,0
    800033f0:	00c0006f          	j	800033fc <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800033f4:	ffffe097          	auipc	ra,0xffffe
    800033f8:	1e0080e7          	jalr	480(ra) # 800015d4 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800033fc:	00009797          	auipc	a5,0x9
    80003400:	ccc7a783          	lw	a5,-820(a5) # 8000c0c8 <_ZL9threadEnd>
    80003404:	02079e63          	bnez	a5,80003440 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003408:	0004a583          	lw	a1,0(s1)
    8000340c:	0305859b          	addiw	a1,a1,48
    80003410:	0084b503          	ld	a0,8(s1)
    80003414:	00003097          	auipc	ra,0x3
    80003418:	350080e7          	jalr	848(ra) # 80006764 <_ZN6Buffer3putEi>
        i++;
    8000341c:	0019071b          	addiw	a4,s2,1
    80003420:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003424:	0004a683          	lw	a3,0(s1)
    80003428:	0026979b          	slliw	a5,a3,0x2
    8000342c:	00d787bb          	addw	a5,a5,a3
    80003430:	0017979b          	slliw	a5,a5,0x1
    80003434:	02f767bb          	remw	a5,a4,a5
    80003438:	fc0792e3          	bnez	a5,800033fc <_ZL8producerPv+0x2c>
    8000343c:	fb9ff06f          	j	800033f4 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003440:	0104b503          	ld	a0,16(s1)
    80003444:	ffffe097          	auipc	ra,0xffffe
    80003448:	298080e7          	jalr	664(ra) # 800016dc <_Z10sem_signalP3Sem>
}
    8000344c:	01813083          	ld	ra,24(sp)
    80003450:	01013403          	ld	s0,16(sp)
    80003454:	00813483          	ld	s1,8(sp)
    80003458:	00013903          	ld	s2,0(sp)
    8000345c:	02010113          	addi	sp,sp,32
    80003460:	00008067          	ret

0000000080003464 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003464:	fd010113          	addi	sp,sp,-48
    80003468:	02113423          	sd	ra,40(sp)
    8000346c:	02813023          	sd	s0,32(sp)
    80003470:	00913c23          	sd	s1,24(sp)
    80003474:	01213823          	sd	s2,16(sp)
    80003478:	01313423          	sd	s3,8(sp)
    8000347c:	03010413          	addi	s0,sp,48
    80003480:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003484:	00000993          	li	s3,0
    80003488:	01c0006f          	j	800034a4 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    8000348c:	ffffe097          	auipc	ra,0xffffe
    80003490:	148080e7          	jalr	328(ra) # 800015d4 <_Z15thread_dispatchv>
    80003494:	0500006f          	j	800034e4 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003498:	00a00513          	li	a0,10
    8000349c:	ffffe097          	auipc	ra,0xffffe
    800034a0:	2e4080e7          	jalr	740(ra) # 80001780 <_Z4putcc>
    while (!threadEnd) {
    800034a4:	00009797          	auipc	a5,0x9
    800034a8:	c247a783          	lw	a5,-988(a5) # 8000c0c8 <_ZL9threadEnd>
    800034ac:	06079063          	bnez	a5,8000350c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800034b0:	00893503          	ld	a0,8(s2)
    800034b4:	00003097          	auipc	ra,0x3
    800034b8:	340080e7          	jalr	832(ra) # 800067f4 <_ZN6Buffer3getEv>
        i++;
    800034bc:	0019849b          	addiw	s1,s3,1
    800034c0:	0004899b          	sext.w	s3,s1
        putc(key);
    800034c4:	0ff57513          	andi	a0,a0,255
    800034c8:	ffffe097          	auipc	ra,0xffffe
    800034cc:	2b8080e7          	jalr	696(ra) # 80001780 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800034d0:	00092703          	lw	a4,0(s2)
    800034d4:	0027179b          	slliw	a5,a4,0x2
    800034d8:	00e787bb          	addw	a5,a5,a4
    800034dc:	02f4e7bb          	remw	a5,s1,a5
    800034e0:	fa0786e3          	beqz	a5,8000348c <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800034e4:	05000793          	li	a5,80
    800034e8:	02f4e4bb          	remw	s1,s1,a5
    800034ec:	fa049ce3          	bnez	s1,800034a4 <_ZL8consumerPv+0x40>
    800034f0:	fa9ff06f          	j	80003498 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800034f4:	00893503          	ld	a0,8(s2)
    800034f8:	00003097          	auipc	ra,0x3
    800034fc:	2fc080e7          	jalr	764(ra) # 800067f4 <_ZN6Buffer3getEv>
        putc(key);
    80003500:	0ff57513          	andi	a0,a0,255
    80003504:	ffffe097          	auipc	ra,0xffffe
    80003508:	27c080e7          	jalr	636(ra) # 80001780 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    8000350c:	00893503          	ld	a0,8(s2)
    80003510:	00003097          	auipc	ra,0x3
    80003514:	370080e7          	jalr	880(ra) # 80006880 <_ZN6Buffer6getCntEv>
    80003518:	fca04ee3          	bgtz	a0,800034f4 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    8000351c:	01093503          	ld	a0,16(s2)
    80003520:	ffffe097          	auipc	ra,0xffffe
    80003524:	1bc080e7          	jalr	444(ra) # 800016dc <_Z10sem_signalP3Sem>
}
    80003528:	02813083          	ld	ra,40(sp)
    8000352c:	02013403          	ld	s0,32(sp)
    80003530:	01813483          	ld	s1,24(sp)
    80003534:	01013903          	ld	s2,16(sp)
    80003538:	00813983          	ld	s3,8(sp)
    8000353c:	03010113          	addi	sp,sp,48
    80003540:	00008067          	ret

0000000080003544 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003544:	f9010113          	addi	sp,sp,-112
    80003548:	06113423          	sd	ra,104(sp)
    8000354c:	06813023          	sd	s0,96(sp)
    80003550:	04913c23          	sd	s1,88(sp)
    80003554:	05213823          	sd	s2,80(sp)
    80003558:	05313423          	sd	s3,72(sp)
    8000355c:	05413023          	sd	s4,64(sp)
    80003560:	03513c23          	sd	s5,56(sp)
    80003564:	03613823          	sd	s6,48(sp)
    80003568:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    8000356c:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003570:	00006517          	auipc	a0,0x6
    80003574:	bc050513          	addi	a0,a0,-1088 # 80009130 <CONSOLE_STATUS+0x120>
    80003578:	00002097          	auipc	ra,0x2
    8000357c:	220080e7          	jalr	544(ra) # 80005798 <_Z11printStringPKc>
    getString(input, 30);
    80003580:	01e00593          	li	a1,30
    80003584:	fa040493          	addi	s1,s0,-96
    80003588:	00048513          	mv	a0,s1
    8000358c:	00002097          	auipc	ra,0x2
    80003590:	294080e7          	jalr	660(ra) # 80005820 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003594:	00048513          	mv	a0,s1
    80003598:	00002097          	auipc	ra,0x2
    8000359c:	360080e7          	jalr	864(ra) # 800058f8 <_Z11stringToIntPKc>
    800035a0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800035a4:	00006517          	auipc	a0,0x6
    800035a8:	bac50513          	addi	a0,a0,-1108 # 80009150 <CONSOLE_STATUS+0x140>
    800035ac:	00002097          	auipc	ra,0x2
    800035b0:	1ec080e7          	jalr	492(ra) # 80005798 <_Z11printStringPKc>
    getString(input, 30);
    800035b4:	01e00593          	li	a1,30
    800035b8:	00048513          	mv	a0,s1
    800035bc:	00002097          	auipc	ra,0x2
    800035c0:	264080e7          	jalr	612(ra) # 80005820 <_Z9getStringPci>
    n = stringToInt(input);
    800035c4:	00048513          	mv	a0,s1
    800035c8:	00002097          	auipc	ra,0x2
    800035cc:	330080e7          	jalr	816(ra) # 800058f8 <_Z11stringToIntPKc>
    800035d0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800035d4:	00006517          	auipc	a0,0x6
    800035d8:	b9c50513          	addi	a0,a0,-1124 # 80009170 <CONSOLE_STATUS+0x160>
    800035dc:	00002097          	auipc	ra,0x2
    800035e0:	1bc080e7          	jalr	444(ra) # 80005798 <_Z11printStringPKc>
    800035e4:	00000613          	li	a2,0
    800035e8:	00a00593          	li	a1,10
    800035ec:	00090513          	mv	a0,s2
    800035f0:	00002097          	auipc	ra,0x2
    800035f4:	358080e7          	jalr	856(ra) # 80005948 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800035f8:	00006517          	auipc	a0,0x6
    800035fc:	b9050513          	addi	a0,a0,-1136 # 80009188 <CONSOLE_STATUS+0x178>
    80003600:	00002097          	auipc	ra,0x2
    80003604:	198080e7          	jalr	408(ra) # 80005798 <_Z11printStringPKc>
    80003608:	00000613          	li	a2,0
    8000360c:	00a00593          	li	a1,10
    80003610:	00048513          	mv	a0,s1
    80003614:	00002097          	auipc	ra,0x2
    80003618:	334080e7          	jalr	820(ra) # 80005948 <_Z8printIntiii>
    printString(".\n");
    8000361c:	00006517          	auipc	a0,0x6
    80003620:	b8450513          	addi	a0,a0,-1148 # 800091a0 <CONSOLE_STATUS+0x190>
    80003624:	00002097          	auipc	ra,0x2
    80003628:	174080e7          	jalr	372(ra) # 80005798 <_Z11printStringPKc>
    if(threadNum > n) {
    8000362c:	0324c463          	blt	s1,s2,80003654 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003630:	03205c63          	blez	s2,80003668 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003634:	03800513          	li	a0,56
    80003638:	fffff097          	auipc	ra,0xfffff
    8000363c:	824080e7          	jalr	-2012(ra) # 80001e5c <_Znwm>
    80003640:	00050a13          	mv	s4,a0
    80003644:	00048593          	mv	a1,s1
    80003648:	00003097          	auipc	ra,0x3
    8000364c:	080080e7          	jalr	128(ra) # 800066c8 <_ZN6BufferC1Ei>
    80003650:	0300006f          	j	80003680 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003654:	00006517          	auipc	a0,0x6
    80003658:	b5450513          	addi	a0,a0,-1196 # 800091a8 <CONSOLE_STATUS+0x198>
    8000365c:	00002097          	auipc	ra,0x2
    80003660:	13c080e7          	jalr	316(ra) # 80005798 <_Z11printStringPKc>
        return;
    80003664:	0140006f          	j	80003678 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003668:	00006517          	auipc	a0,0x6
    8000366c:	b8050513          	addi	a0,a0,-1152 # 800091e8 <CONSOLE_STATUS+0x1d8>
    80003670:	00002097          	auipc	ra,0x2
    80003674:	128080e7          	jalr	296(ra) # 80005798 <_Z11printStringPKc>
        return;
    80003678:	000b0113          	mv	sp,s6
    8000367c:	1500006f          	j	800037cc <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003680:	00000593          	li	a1,0
    80003684:	00009517          	auipc	a0,0x9
    80003688:	a4c50513          	addi	a0,a0,-1460 # 8000c0d0 <_ZL10waitForAll>
    8000368c:	ffffe097          	auipc	ra,0xffffe
    80003690:	fa4080e7          	jalr	-92(ra) # 80001630 <_Z8sem_openPP3Semj>
    thread_t threads[threadNum];
    80003694:	00391793          	slli	a5,s2,0x3
    80003698:	00f78793          	addi	a5,a5,15
    8000369c:	ff07f793          	andi	a5,a5,-16
    800036a0:	40f10133          	sub	sp,sp,a5
    800036a4:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800036a8:	0019071b          	addiw	a4,s2,1
    800036ac:	00171793          	slli	a5,a4,0x1
    800036b0:	00e787b3          	add	a5,a5,a4
    800036b4:	00379793          	slli	a5,a5,0x3
    800036b8:	00f78793          	addi	a5,a5,15
    800036bc:	ff07f793          	andi	a5,a5,-16
    800036c0:	40f10133          	sub	sp,sp,a5
    800036c4:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800036c8:	00191613          	slli	a2,s2,0x1
    800036cc:	012607b3          	add	a5,a2,s2
    800036d0:	00379793          	slli	a5,a5,0x3
    800036d4:	00f987b3          	add	a5,s3,a5
    800036d8:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800036dc:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800036e0:	00009717          	auipc	a4,0x9
    800036e4:	9f073703          	ld	a4,-1552(a4) # 8000c0d0 <_ZL10waitForAll>
    800036e8:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800036ec:	00078613          	mv	a2,a5
    800036f0:	00000597          	auipc	a1,0x0
    800036f4:	d7458593          	addi	a1,a1,-652 # 80003464 <_ZL8consumerPv>
    800036f8:	f9840513          	addi	a0,s0,-104
    800036fc:	ffffe097          	auipc	ra,0xffffe
    80003700:	e30080e7          	jalr	-464(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003704:	00000493          	li	s1,0
    80003708:	0280006f          	j	80003730 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    8000370c:	00000597          	auipc	a1,0x0
    80003710:	c1458593          	addi	a1,a1,-1004 # 80003320 <_ZL16producerKeyboardPv>
                      data + i);
    80003714:	00179613          	slli	a2,a5,0x1
    80003718:	00f60633          	add	a2,a2,a5
    8000371c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003720:	00c98633          	add	a2,s3,a2
    80003724:	ffffe097          	auipc	ra,0xffffe
    80003728:	e08080e7          	jalr	-504(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000372c:	0014849b          	addiw	s1,s1,1
    80003730:	0524d263          	bge	s1,s2,80003774 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003734:	00149793          	slli	a5,s1,0x1
    80003738:	009787b3          	add	a5,a5,s1
    8000373c:	00379793          	slli	a5,a5,0x3
    80003740:	00f987b3          	add	a5,s3,a5
    80003744:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003748:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    8000374c:	00009717          	auipc	a4,0x9
    80003750:	98473703          	ld	a4,-1660(a4) # 8000c0d0 <_ZL10waitForAll>
    80003754:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003758:	00048793          	mv	a5,s1
    8000375c:	00349513          	slli	a0,s1,0x3
    80003760:	00aa8533          	add	a0,s5,a0
    80003764:	fa9054e3          	blez	s1,8000370c <_Z22producerConsumer_C_APIv+0x1c8>
    80003768:	00000597          	auipc	a1,0x0
    8000376c:	c6858593          	addi	a1,a1,-920 # 800033d0 <_ZL8producerPv>
    80003770:	fa5ff06f          	j	80003714 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003774:	ffffe097          	auipc	ra,0xffffe
    80003778:	e60080e7          	jalr	-416(ra) # 800015d4 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    8000377c:	00000493          	li	s1,0
    80003780:	00994e63          	blt	s2,s1,8000379c <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003784:	00009517          	auipc	a0,0x9
    80003788:	94c53503          	ld	a0,-1716(a0) # 8000c0d0 <_ZL10waitForAll>
    8000378c:	ffffe097          	auipc	ra,0xffffe
    80003790:	f18080e7          	jalr	-232(ra) # 800016a4 <_Z8sem_waitP3Sem>
    for (int i = 0; i <= threadNum; i++) {
    80003794:	0014849b          	addiw	s1,s1,1
    80003798:	fe9ff06f          	j	80003780 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    8000379c:	00009517          	auipc	a0,0x9
    800037a0:	93453503          	ld	a0,-1740(a0) # 8000c0d0 <_ZL10waitForAll>
    800037a4:	ffffe097          	auipc	ra,0xffffe
    800037a8:	ec8080e7          	jalr	-312(ra) # 8000166c <_Z9sem_closeP3Sem>
    delete buffer;
    800037ac:	000a0e63          	beqz	s4,800037c8 <_Z22producerConsumer_C_APIv+0x284>
    800037b0:	000a0513          	mv	a0,s4
    800037b4:	00003097          	auipc	ra,0x3
    800037b8:	154080e7          	jalr	340(ra) # 80006908 <_ZN6BufferD1Ev>
    800037bc:	000a0513          	mv	a0,s4
    800037c0:	ffffe097          	auipc	ra,0xffffe
    800037c4:	6ec080e7          	jalr	1772(ra) # 80001eac <_ZdlPv>
    800037c8:	000b0113          	mv	sp,s6

}
    800037cc:	f9040113          	addi	sp,s0,-112
    800037d0:	06813083          	ld	ra,104(sp)
    800037d4:	06013403          	ld	s0,96(sp)
    800037d8:	05813483          	ld	s1,88(sp)
    800037dc:	05013903          	ld	s2,80(sp)
    800037e0:	04813983          	ld	s3,72(sp)
    800037e4:	04013a03          	ld	s4,64(sp)
    800037e8:	03813a83          	ld	s5,56(sp)
    800037ec:	03013b03          	ld	s6,48(sp)
    800037f0:	07010113          	addi	sp,sp,112
    800037f4:	00008067          	ret
    800037f8:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800037fc:	000a0513          	mv	a0,s4
    80003800:	ffffe097          	auipc	ra,0xffffe
    80003804:	6ac080e7          	jalr	1708(ra) # 80001eac <_ZdlPv>
    80003808:	00048513          	mv	a0,s1
    8000380c:	0000a097          	auipc	ra,0xa
    80003810:	9dc080e7          	jalr	-1572(ra) # 8000d1e8 <_Unwind_Resume>

0000000080003814 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003814:	fe010113          	addi	sp,sp,-32
    80003818:	00113c23          	sd	ra,24(sp)
    8000381c:	00813823          	sd	s0,16(sp)
    80003820:	00913423          	sd	s1,8(sp)
    80003824:	01213023          	sd	s2,0(sp)
    80003828:	02010413          	addi	s0,sp,32
    8000382c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003830:	00100793          	li	a5,1
    80003834:	02a7f863          	bgeu	a5,a0,80003864 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003838:	00a00793          	li	a5,10
    8000383c:	02f577b3          	remu	a5,a0,a5
    80003840:	02078e63          	beqz	a5,8000387c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003844:	fff48513          	addi	a0,s1,-1
    80003848:	00000097          	auipc	ra,0x0
    8000384c:	fcc080e7          	jalr	-52(ra) # 80003814 <_ZL9fibonaccim>
    80003850:	00050913          	mv	s2,a0
    80003854:	ffe48513          	addi	a0,s1,-2
    80003858:	00000097          	auipc	ra,0x0
    8000385c:	fbc080e7          	jalr	-68(ra) # 80003814 <_ZL9fibonaccim>
    80003860:	00a90533          	add	a0,s2,a0
}
    80003864:	01813083          	ld	ra,24(sp)
    80003868:	01013403          	ld	s0,16(sp)
    8000386c:	00813483          	ld	s1,8(sp)
    80003870:	00013903          	ld	s2,0(sp)
    80003874:	02010113          	addi	sp,sp,32
    80003878:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000387c:	ffffe097          	auipc	ra,0xffffe
    80003880:	d58080e7          	jalr	-680(ra) # 800015d4 <_Z15thread_dispatchv>
    80003884:	fc1ff06f          	j	80003844 <_ZL9fibonaccim+0x30>

0000000080003888 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003888:	fe010113          	addi	sp,sp,-32
    8000388c:	00113c23          	sd	ra,24(sp)
    80003890:	00813823          	sd	s0,16(sp)
    80003894:	00913423          	sd	s1,8(sp)
    80003898:	01213023          	sd	s2,0(sp)
    8000389c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800038a0:	00000913          	li	s2,0
    800038a4:	0380006f          	j	800038dc <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800038a8:	ffffe097          	auipc	ra,0xffffe
    800038ac:	d2c080e7          	jalr	-724(ra) # 800015d4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800038b0:	00148493          	addi	s1,s1,1
    800038b4:	000027b7          	lui	a5,0x2
    800038b8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800038bc:	0097ee63          	bltu	a5,s1,800038d8 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800038c0:	00000713          	li	a4,0
    800038c4:	000077b7          	lui	a5,0x7
    800038c8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800038cc:	fce7eee3          	bltu	a5,a4,800038a8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800038d0:	00170713          	addi	a4,a4,1
    800038d4:	ff1ff06f          	j	800038c4 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800038d8:	00190913          	addi	s2,s2,1
    800038dc:	00900793          	li	a5,9
    800038e0:	0527e063          	bltu	a5,s2,80003920 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800038e4:	00006517          	auipc	a0,0x6
    800038e8:	93450513          	addi	a0,a0,-1740 # 80009218 <CONSOLE_STATUS+0x208>
    800038ec:	00002097          	auipc	ra,0x2
    800038f0:	eac080e7          	jalr	-340(ra) # 80005798 <_Z11printStringPKc>
    800038f4:	00000613          	li	a2,0
    800038f8:	00a00593          	li	a1,10
    800038fc:	0009051b          	sext.w	a0,s2
    80003900:	00002097          	auipc	ra,0x2
    80003904:	048080e7          	jalr	72(ra) # 80005948 <_Z8printIntiii>
    80003908:	00006517          	auipc	a0,0x6
    8000390c:	b7050513          	addi	a0,a0,-1168 # 80009478 <CONSOLE_STATUS+0x468>
    80003910:	00002097          	auipc	ra,0x2
    80003914:	e88080e7          	jalr	-376(ra) # 80005798 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003918:	00000493          	li	s1,0
    8000391c:	f99ff06f          	j	800038b4 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003920:	00006517          	auipc	a0,0x6
    80003924:	90050513          	addi	a0,a0,-1792 # 80009220 <CONSOLE_STATUS+0x210>
    80003928:	00002097          	auipc	ra,0x2
    8000392c:	e70080e7          	jalr	-400(ra) # 80005798 <_Z11printStringPKc>
    finishedA = true;
    80003930:	00100793          	li	a5,1
    80003934:	00008717          	auipc	a4,0x8
    80003938:	7af70223          	sb	a5,1956(a4) # 8000c0d8 <_ZL9finishedA>
}
    8000393c:	01813083          	ld	ra,24(sp)
    80003940:	01013403          	ld	s0,16(sp)
    80003944:	00813483          	ld	s1,8(sp)
    80003948:	00013903          	ld	s2,0(sp)
    8000394c:	02010113          	addi	sp,sp,32
    80003950:	00008067          	ret

0000000080003954 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003954:	fe010113          	addi	sp,sp,-32
    80003958:	00113c23          	sd	ra,24(sp)
    8000395c:	00813823          	sd	s0,16(sp)
    80003960:	00913423          	sd	s1,8(sp)
    80003964:	01213023          	sd	s2,0(sp)
    80003968:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000396c:	00000913          	li	s2,0
    80003970:	0380006f          	j	800039a8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003974:	ffffe097          	auipc	ra,0xffffe
    80003978:	c60080e7          	jalr	-928(ra) # 800015d4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000397c:	00148493          	addi	s1,s1,1
    80003980:	000027b7          	lui	a5,0x2
    80003984:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003988:	0097ee63          	bltu	a5,s1,800039a4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000398c:	00000713          	li	a4,0
    80003990:	000077b7          	lui	a5,0x7
    80003994:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003998:	fce7eee3          	bltu	a5,a4,80003974 <_ZN7WorkerB11workerBodyBEPv+0x20>
    8000399c:	00170713          	addi	a4,a4,1
    800039a0:	ff1ff06f          	j	80003990 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800039a4:	00190913          	addi	s2,s2,1
    800039a8:	00f00793          	li	a5,15
    800039ac:	0527e063          	bltu	a5,s2,800039ec <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800039b0:	00006517          	auipc	a0,0x6
    800039b4:	88050513          	addi	a0,a0,-1920 # 80009230 <CONSOLE_STATUS+0x220>
    800039b8:	00002097          	auipc	ra,0x2
    800039bc:	de0080e7          	jalr	-544(ra) # 80005798 <_Z11printStringPKc>
    800039c0:	00000613          	li	a2,0
    800039c4:	00a00593          	li	a1,10
    800039c8:	0009051b          	sext.w	a0,s2
    800039cc:	00002097          	auipc	ra,0x2
    800039d0:	f7c080e7          	jalr	-132(ra) # 80005948 <_Z8printIntiii>
    800039d4:	00006517          	auipc	a0,0x6
    800039d8:	aa450513          	addi	a0,a0,-1372 # 80009478 <CONSOLE_STATUS+0x468>
    800039dc:	00002097          	auipc	ra,0x2
    800039e0:	dbc080e7          	jalr	-580(ra) # 80005798 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800039e4:	00000493          	li	s1,0
    800039e8:	f99ff06f          	j	80003980 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800039ec:	00006517          	auipc	a0,0x6
    800039f0:	84c50513          	addi	a0,a0,-1972 # 80009238 <CONSOLE_STATUS+0x228>
    800039f4:	00002097          	auipc	ra,0x2
    800039f8:	da4080e7          	jalr	-604(ra) # 80005798 <_Z11printStringPKc>
    finishedB = true;
    800039fc:	00100793          	li	a5,1
    80003a00:	00008717          	auipc	a4,0x8
    80003a04:	6cf70ca3          	sb	a5,1753(a4) # 8000c0d9 <_ZL9finishedB>
    thread_dispatch();
    80003a08:	ffffe097          	auipc	ra,0xffffe
    80003a0c:	bcc080e7          	jalr	-1076(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80003a10:	01813083          	ld	ra,24(sp)
    80003a14:	01013403          	ld	s0,16(sp)
    80003a18:	00813483          	ld	s1,8(sp)
    80003a1c:	00013903          	ld	s2,0(sp)
    80003a20:	02010113          	addi	sp,sp,32
    80003a24:	00008067          	ret

0000000080003a28 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003a28:	fe010113          	addi	sp,sp,-32
    80003a2c:	00113c23          	sd	ra,24(sp)
    80003a30:	00813823          	sd	s0,16(sp)
    80003a34:	00913423          	sd	s1,8(sp)
    80003a38:	01213023          	sd	s2,0(sp)
    80003a3c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003a40:	00000493          	li	s1,0
    80003a44:	0400006f          	j	80003a84 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003a48:	00006517          	auipc	a0,0x6
    80003a4c:	80050513          	addi	a0,a0,-2048 # 80009248 <CONSOLE_STATUS+0x238>
    80003a50:	00002097          	auipc	ra,0x2
    80003a54:	d48080e7          	jalr	-696(ra) # 80005798 <_Z11printStringPKc>
    80003a58:	00000613          	li	a2,0
    80003a5c:	00a00593          	li	a1,10
    80003a60:	00048513          	mv	a0,s1
    80003a64:	00002097          	auipc	ra,0x2
    80003a68:	ee4080e7          	jalr	-284(ra) # 80005948 <_Z8printIntiii>
    80003a6c:	00006517          	auipc	a0,0x6
    80003a70:	a0c50513          	addi	a0,a0,-1524 # 80009478 <CONSOLE_STATUS+0x468>
    80003a74:	00002097          	auipc	ra,0x2
    80003a78:	d24080e7          	jalr	-732(ra) # 80005798 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003a7c:	0014849b          	addiw	s1,s1,1
    80003a80:	0ff4f493          	andi	s1,s1,255
    80003a84:	00200793          	li	a5,2
    80003a88:	fc97f0e3          	bgeu	a5,s1,80003a48 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003a8c:	00005517          	auipc	a0,0x5
    80003a90:	7c450513          	addi	a0,a0,1988 # 80009250 <CONSOLE_STATUS+0x240>
    80003a94:	00002097          	auipc	ra,0x2
    80003a98:	d04080e7          	jalr	-764(ra) # 80005798 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003a9c:	00700313          	li	t1,7
    thread_dispatch();
    80003aa0:	ffffe097          	auipc	ra,0xffffe
    80003aa4:	b34080e7          	jalr	-1228(ra) # 800015d4 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003aa8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003aac:	00005517          	auipc	a0,0x5
    80003ab0:	7b450513          	addi	a0,a0,1972 # 80009260 <CONSOLE_STATUS+0x250>
    80003ab4:	00002097          	auipc	ra,0x2
    80003ab8:	ce4080e7          	jalr	-796(ra) # 80005798 <_Z11printStringPKc>
    80003abc:	00000613          	li	a2,0
    80003ac0:	00a00593          	li	a1,10
    80003ac4:	0009051b          	sext.w	a0,s2
    80003ac8:	00002097          	auipc	ra,0x2
    80003acc:	e80080e7          	jalr	-384(ra) # 80005948 <_Z8printIntiii>
    80003ad0:	00006517          	auipc	a0,0x6
    80003ad4:	9a850513          	addi	a0,a0,-1624 # 80009478 <CONSOLE_STATUS+0x468>
    80003ad8:	00002097          	auipc	ra,0x2
    80003adc:	cc0080e7          	jalr	-832(ra) # 80005798 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003ae0:	00c00513          	li	a0,12
    80003ae4:	00000097          	auipc	ra,0x0
    80003ae8:	d30080e7          	jalr	-720(ra) # 80003814 <_ZL9fibonaccim>
    80003aec:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003af0:	00005517          	auipc	a0,0x5
    80003af4:	77850513          	addi	a0,a0,1912 # 80009268 <CONSOLE_STATUS+0x258>
    80003af8:	00002097          	auipc	ra,0x2
    80003afc:	ca0080e7          	jalr	-864(ra) # 80005798 <_Z11printStringPKc>
    80003b00:	00000613          	li	a2,0
    80003b04:	00a00593          	li	a1,10
    80003b08:	0009051b          	sext.w	a0,s2
    80003b0c:	00002097          	auipc	ra,0x2
    80003b10:	e3c080e7          	jalr	-452(ra) # 80005948 <_Z8printIntiii>
    80003b14:	00006517          	auipc	a0,0x6
    80003b18:	96450513          	addi	a0,a0,-1692 # 80009478 <CONSOLE_STATUS+0x468>
    80003b1c:	00002097          	auipc	ra,0x2
    80003b20:	c7c080e7          	jalr	-900(ra) # 80005798 <_Z11printStringPKc>
    80003b24:	0400006f          	j	80003b64 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003b28:	00005517          	auipc	a0,0x5
    80003b2c:	72050513          	addi	a0,a0,1824 # 80009248 <CONSOLE_STATUS+0x238>
    80003b30:	00002097          	auipc	ra,0x2
    80003b34:	c68080e7          	jalr	-920(ra) # 80005798 <_Z11printStringPKc>
    80003b38:	00000613          	li	a2,0
    80003b3c:	00a00593          	li	a1,10
    80003b40:	00048513          	mv	a0,s1
    80003b44:	00002097          	auipc	ra,0x2
    80003b48:	e04080e7          	jalr	-508(ra) # 80005948 <_Z8printIntiii>
    80003b4c:	00006517          	auipc	a0,0x6
    80003b50:	92c50513          	addi	a0,a0,-1748 # 80009478 <CONSOLE_STATUS+0x468>
    80003b54:	00002097          	auipc	ra,0x2
    80003b58:	c44080e7          	jalr	-956(ra) # 80005798 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003b5c:	0014849b          	addiw	s1,s1,1
    80003b60:	0ff4f493          	andi	s1,s1,255
    80003b64:	00500793          	li	a5,5
    80003b68:	fc97f0e3          	bgeu	a5,s1,80003b28 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80003b6c:	00005517          	auipc	a0,0x5
    80003b70:	70c50513          	addi	a0,a0,1804 # 80009278 <CONSOLE_STATUS+0x268>
    80003b74:	00002097          	auipc	ra,0x2
    80003b78:	c24080e7          	jalr	-988(ra) # 80005798 <_Z11printStringPKc>
    finishedC = true;
    80003b7c:	00100793          	li	a5,1
    80003b80:	00008717          	auipc	a4,0x8
    80003b84:	54f70d23          	sb	a5,1370(a4) # 8000c0da <_ZL9finishedC>
    thread_dispatch();
    80003b88:	ffffe097          	auipc	ra,0xffffe
    80003b8c:	a4c080e7          	jalr	-1460(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80003b90:	01813083          	ld	ra,24(sp)
    80003b94:	01013403          	ld	s0,16(sp)
    80003b98:	00813483          	ld	s1,8(sp)
    80003b9c:	00013903          	ld	s2,0(sp)
    80003ba0:	02010113          	addi	sp,sp,32
    80003ba4:	00008067          	ret

0000000080003ba8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003ba8:	fe010113          	addi	sp,sp,-32
    80003bac:	00113c23          	sd	ra,24(sp)
    80003bb0:	00813823          	sd	s0,16(sp)
    80003bb4:	00913423          	sd	s1,8(sp)
    80003bb8:	01213023          	sd	s2,0(sp)
    80003bbc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003bc0:	00a00493          	li	s1,10
    80003bc4:	0400006f          	j	80003c04 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003bc8:	00005517          	auipc	a0,0x5
    80003bcc:	6c050513          	addi	a0,a0,1728 # 80009288 <CONSOLE_STATUS+0x278>
    80003bd0:	00002097          	auipc	ra,0x2
    80003bd4:	bc8080e7          	jalr	-1080(ra) # 80005798 <_Z11printStringPKc>
    80003bd8:	00000613          	li	a2,0
    80003bdc:	00a00593          	li	a1,10
    80003be0:	00048513          	mv	a0,s1
    80003be4:	00002097          	auipc	ra,0x2
    80003be8:	d64080e7          	jalr	-668(ra) # 80005948 <_Z8printIntiii>
    80003bec:	00006517          	auipc	a0,0x6
    80003bf0:	88c50513          	addi	a0,a0,-1908 # 80009478 <CONSOLE_STATUS+0x468>
    80003bf4:	00002097          	auipc	ra,0x2
    80003bf8:	ba4080e7          	jalr	-1116(ra) # 80005798 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003bfc:	0014849b          	addiw	s1,s1,1
    80003c00:	0ff4f493          	andi	s1,s1,255
    80003c04:	00c00793          	li	a5,12
    80003c08:	fc97f0e3          	bgeu	a5,s1,80003bc8 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003c0c:	00005517          	auipc	a0,0x5
    80003c10:	68450513          	addi	a0,a0,1668 # 80009290 <CONSOLE_STATUS+0x280>
    80003c14:	00002097          	auipc	ra,0x2
    80003c18:	b84080e7          	jalr	-1148(ra) # 80005798 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003c1c:	00500313          	li	t1,5
    thread_dispatch();
    80003c20:	ffffe097          	auipc	ra,0xffffe
    80003c24:	9b4080e7          	jalr	-1612(ra) # 800015d4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003c28:	01000513          	li	a0,16
    80003c2c:	00000097          	auipc	ra,0x0
    80003c30:	be8080e7          	jalr	-1048(ra) # 80003814 <_ZL9fibonaccim>
    80003c34:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003c38:	00005517          	auipc	a0,0x5
    80003c3c:	66850513          	addi	a0,a0,1640 # 800092a0 <CONSOLE_STATUS+0x290>
    80003c40:	00002097          	auipc	ra,0x2
    80003c44:	b58080e7          	jalr	-1192(ra) # 80005798 <_Z11printStringPKc>
    80003c48:	00000613          	li	a2,0
    80003c4c:	00a00593          	li	a1,10
    80003c50:	0009051b          	sext.w	a0,s2
    80003c54:	00002097          	auipc	ra,0x2
    80003c58:	cf4080e7          	jalr	-780(ra) # 80005948 <_Z8printIntiii>
    80003c5c:	00006517          	auipc	a0,0x6
    80003c60:	81c50513          	addi	a0,a0,-2020 # 80009478 <CONSOLE_STATUS+0x468>
    80003c64:	00002097          	auipc	ra,0x2
    80003c68:	b34080e7          	jalr	-1228(ra) # 80005798 <_Z11printStringPKc>
    80003c6c:	0400006f          	j	80003cac <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003c70:	00005517          	auipc	a0,0x5
    80003c74:	61850513          	addi	a0,a0,1560 # 80009288 <CONSOLE_STATUS+0x278>
    80003c78:	00002097          	auipc	ra,0x2
    80003c7c:	b20080e7          	jalr	-1248(ra) # 80005798 <_Z11printStringPKc>
    80003c80:	00000613          	li	a2,0
    80003c84:	00a00593          	li	a1,10
    80003c88:	00048513          	mv	a0,s1
    80003c8c:	00002097          	auipc	ra,0x2
    80003c90:	cbc080e7          	jalr	-836(ra) # 80005948 <_Z8printIntiii>
    80003c94:	00005517          	auipc	a0,0x5
    80003c98:	7e450513          	addi	a0,a0,2020 # 80009478 <CONSOLE_STATUS+0x468>
    80003c9c:	00002097          	auipc	ra,0x2
    80003ca0:	afc080e7          	jalr	-1284(ra) # 80005798 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003ca4:	0014849b          	addiw	s1,s1,1
    80003ca8:	0ff4f493          	andi	s1,s1,255
    80003cac:	00f00793          	li	a5,15
    80003cb0:	fc97f0e3          	bgeu	a5,s1,80003c70 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003cb4:	00005517          	auipc	a0,0x5
    80003cb8:	5fc50513          	addi	a0,a0,1532 # 800092b0 <CONSOLE_STATUS+0x2a0>
    80003cbc:	00002097          	auipc	ra,0x2
    80003cc0:	adc080e7          	jalr	-1316(ra) # 80005798 <_Z11printStringPKc>
    finishedD = true;
    80003cc4:	00100793          	li	a5,1
    80003cc8:	00008717          	auipc	a4,0x8
    80003ccc:	40f709a3          	sb	a5,1043(a4) # 8000c0db <_ZL9finishedD>
    thread_dispatch();
    80003cd0:	ffffe097          	auipc	ra,0xffffe
    80003cd4:	904080e7          	jalr	-1788(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80003cd8:	01813083          	ld	ra,24(sp)
    80003cdc:	01013403          	ld	s0,16(sp)
    80003ce0:	00813483          	ld	s1,8(sp)
    80003ce4:	00013903          	ld	s2,0(sp)
    80003ce8:	02010113          	addi	sp,sp,32
    80003cec:	00008067          	ret

0000000080003cf0 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003cf0:	fc010113          	addi	sp,sp,-64
    80003cf4:	02113c23          	sd	ra,56(sp)
    80003cf8:	02813823          	sd	s0,48(sp)
    80003cfc:	02913423          	sd	s1,40(sp)
    80003d00:	03213023          	sd	s2,32(sp)
    80003d04:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003d08:	02000513          	li	a0,32
    80003d0c:	ffffe097          	auipc	ra,0xffffe
    80003d10:	150080e7          	jalr	336(ra) # 80001e5c <_Znwm>
    80003d14:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003d18:	ffffe097          	auipc	ra,0xffffe
    80003d1c:	2f4080e7          	jalr	756(ra) # 8000200c <_ZN6ThreadC1Ev>
    80003d20:	00008797          	auipc	a5,0x8
    80003d24:	90078793          	addi	a5,a5,-1792 # 8000b620 <_ZTV7WorkerA+0x10>
    80003d28:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003d2c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003d30:	00005517          	auipc	a0,0x5
    80003d34:	59050513          	addi	a0,a0,1424 # 800092c0 <CONSOLE_STATUS+0x2b0>
    80003d38:	00002097          	auipc	ra,0x2
    80003d3c:	a60080e7          	jalr	-1440(ra) # 80005798 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003d40:	02000513          	li	a0,32
    80003d44:	ffffe097          	auipc	ra,0xffffe
    80003d48:	118080e7          	jalr	280(ra) # 80001e5c <_Znwm>
    80003d4c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003d50:	ffffe097          	auipc	ra,0xffffe
    80003d54:	2bc080e7          	jalr	700(ra) # 8000200c <_ZN6ThreadC1Ev>
    80003d58:	00008797          	auipc	a5,0x8
    80003d5c:	8f078793          	addi	a5,a5,-1808 # 8000b648 <_ZTV7WorkerB+0x10>
    80003d60:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003d64:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003d68:	00005517          	auipc	a0,0x5
    80003d6c:	57050513          	addi	a0,a0,1392 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80003d70:	00002097          	auipc	ra,0x2
    80003d74:	a28080e7          	jalr	-1496(ra) # 80005798 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003d78:	02000513          	li	a0,32
    80003d7c:	ffffe097          	auipc	ra,0xffffe
    80003d80:	0e0080e7          	jalr	224(ra) # 80001e5c <_Znwm>
    80003d84:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003d88:	ffffe097          	auipc	ra,0xffffe
    80003d8c:	284080e7          	jalr	644(ra) # 8000200c <_ZN6ThreadC1Ev>
    80003d90:	00008797          	auipc	a5,0x8
    80003d94:	8e078793          	addi	a5,a5,-1824 # 8000b670 <_ZTV7WorkerC+0x10>
    80003d98:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003d9c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003da0:	00005517          	auipc	a0,0x5
    80003da4:	55050513          	addi	a0,a0,1360 # 800092f0 <CONSOLE_STATUS+0x2e0>
    80003da8:	00002097          	auipc	ra,0x2
    80003dac:	9f0080e7          	jalr	-1552(ra) # 80005798 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003db0:	02000513          	li	a0,32
    80003db4:	ffffe097          	auipc	ra,0xffffe
    80003db8:	0a8080e7          	jalr	168(ra) # 80001e5c <_Znwm>
    80003dbc:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003dc0:	ffffe097          	auipc	ra,0xffffe
    80003dc4:	24c080e7          	jalr	588(ra) # 8000200c <_ZN6ThreadC1Ev>
    80003dc8:	00008797          	auipc	a5,0x8
    80003dcc:	8d078793          	addi	a5,a5,-1840 # 8000b698 <_ZTV7WorkerD+0x10>
    80003dd0:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80003dd4:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003dd8:	00005517          	auipc	a0,0x5
    80003ddc:	53050513          	addi	a0,a0,1328 # 80009308 <CONSOLE_STATUS+0x2f8>
    80003de0:	00002097          	auipc	ra,0x2
    80003de4:	9b8080e7          	jalr	-1608(ra) # 80005798 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003de8:	00000493          	li	s1,0
    80003dec:	00300793          	li	a5,3
    80003df0:	0297c663          	blt	a5,s1,80003e1c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80003df4:	00349793          	slli	a5,s1,0x3
    80003df8:	fe040713          	addi	a4,s0,-32
    80003dfc:	00f707b3          	add	a5,a4,a5
    80003e00:	fe07b503          	ld	a0,-32(a5)
    80003e04:	ffffe097          	auipc	ra,0xffffe
    80003e08:	240080e7          	jalr	576(ra) # 80002044 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003e0c:	0014849b          	addiw	s1,s1,1
    80003e10:	fddff06f          	j	80003dec <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003e14:	ffffe097          	auipc	ra,0xffffe
    80003e18:	294080e7          	jalr	660(ra) # 800020a8 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003e1c:	00008797          	auipc	a5,0x8
    80003e20:	2bc7c783          	lbu	a5,700(a5) # 8000c0d8 <_ZL9finishedA>
    80003e24:	fe0788e3          	beqz	a5,80003e14 <_Z20Threads_CPP_API_testv+0x124>
    80003e28:	00008797          	auipc	a5,0x8
    80003e2c:	2b17c783          	lbu	a5,689(a5) # 8000c0d9 <_ZL9finishedB>
    80003e30:	fe0782e3          	beqz	a5,80003e14 <_Z20Threads_CPP_API_testv+0x124>
    80003e34:	00008797          	auipc	a5,0x8
    80003e38:	2a67c783          	lbu	a5,678(a5) # 8000c0da <_ZL9finishedC>
    80003e3c:	fc078ce3          	beqz	a5,80003e14 <_Z20Threads_CPP_API_testv+0x124>
    80003e40:	00008797          	auipc	a5,0x8
    80003e44:	29b7c783          	lbu	a5,667(a5) # 8000c0db <_ZL9finishedD>
    80003e48:	fc0786e3          	beqz	a5,80003e14 <_Z20Threads_CPP_API_testv+0x124>
    80003e4c:	fc040493          	addi	s1,s0,-64
    80003e50:	0080006f          	j	80003e58 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80003e54:	00848493          	addi	s1,s1,8
    80003e58:	fe040793          	addi	a5,s0,-32
    80003e5c:	08f48663          	beq	s1,a5,80003ee8 <_Z20Threads_CPP_API_testv+0x1f8>
    80003e60:	0004b503          	ld	a0,0(s1)
    80003e64:	fe0508e3          	beqz	a0,80003e54 <_Z20Threads_CPP_API_testv+0x164>
    80003e68:	00053783          	ld	a5,0(a0)
    80003e6c:	0087b783          	ld	a5,8(a5)
    80003e70:	000780e7          	jalr	a5
    80003e74:	fe1ff06f          	j	80003e54 <_Z20Threads_CPP_API_testv+0x164>
    80003e78:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003e7c:	00048513          	mv	a0,s1
    80003e80:	ffffe097          	auipc	ra,0xffffe
    80003e84:	02c080e7          	jalr	44(ra) # 80001eac <_ZdlPv>
    80003e88:	00090513          	mv	a0,s2
    80003e8c:	00009097          	auipc	ra,0x9
    80003e90:	35c080e7          	jalr	860(ra) # 8000d1e8 <_Unwind_Resume>
    80003e94:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003e98:	00048513          	mv	a0,s1
    80003e9c:	ffffe097          	auipc	ra,0xffffe
    80003ea0:	010080e7          	jalr	16(ra) # 80001eac <_ZdlPv>
    80003ea4:	00090513          	mv	a0,s2
    80003ea8:	00009097          	auipc	ra,0x9
    80003eac:	340080e7          	jalr	832(ra) # 8000d1e8 <_Unwind_Resume>
    80003eb0:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003eb4:	00048513          	mv	a0,s1
    80003eb8:	ffffe097          	auipc	ra,0xffffe
    80003ebc:	ff4080e7          	jalr	-12(ra) # 80001eac <_ZdlPv>
    80003ec0:	00090513          	mv	a0,s2
    80003ec4:	00009097          	auipc	ra,0x9
    80003ec8:	324080e7          	jalr	804(ra) # 8000d1e8 <_Unwind_Resume>
    80003ecc:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80003ed0:	00048513          	mv	a0,s1
    80003ed4:	ffffe097          	auipc	ra,0xffffe
    80003ed8:	fd8080e7          	jalr	-40(ra) # 80001eac <_ZdlPv>
    80003edc:	00090513          	mv	a0,s2
    80003ee0:	00009097          	auipc	ra,0x9
    80003ee4:	308080e7          	jalr	776(ra) # 8000d1e8 <_Unwind_Resume>
}
    80003ee8:	03813083          	ld	ra,56(sp)
    80003eec:	03013403          	ld	s0,48(sp)
    80003ef0:	02813483          	ld	s1,40(sp)
    80003ef4:	02013903          	ld	s2,32(sp)
    80003ef8:	04010113          	addi	sp,sp,64
    80003efc:	00008067          	ret

0000000080003f00 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003f00:	ff010113          	addi	sp,sp,-16
    80003f04:	00113423          	sd	ra,8(sp)
    80003f08:	00813023          	sd	s0,0(sp)
    80003f0c:	01010413          	addi	s0,sp,16
    80003f10:	00007797          	auipc	a5,0x7
    80003f14:	71078793          	addi	a5,a5,1808 # 8000b620 <_ZTV7WorkerA+0x10>
    80003f18:	00f53023          	sd	a5,0(a0)
    80003f1c:	ffffe097          	auipc	ra,0xffffe
    80003f20:	fb8080e7          	jalr	-72(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    80003f24:	00813083          	ld	ra,8(sp)
    80003f28:	00013403          	ld	s0,0(sp)
    80003f2c:	01010113          	addi	sp,sp,16
    80003f30:	00008067          	ret

0000000080003f34 <_ZN7WorkerAD0Ev>:
    80003f34:	fe010113          	addi	sp,sp,-32
    80003f38:	00113c23          	sd	ra,24(sp)
    80003f3c:	00813823          	sd	s0,16(sp)
    80003f40:	00913423          	sd	s1,8(sp)
    80003f44:	02010413          	addi	s0,sp,32
    80003f48:	00050493          	mv	s1,a0
    80003f4c:	00007797          	auipc	a5,0x7
    80003f50:	6d478793          	addi	a5,a5,1748 # 8000b620 <_ZTV7WorkerA+0x10>
    80003f54:	00f53023          	sd	a5,0(a0)
    80003f58:	ffffe097          	auipc	ra,0xffffe
    80003f5c:	f7c080e7          	jalr	-132(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    80003f60:	00048513          	mv	a0,s1
    80003f64:	ffffe097          	auipc	ra,0xffffe
    80003f68:	f48080e7          	jalr	-184(ra) # 80001eac <_ZdlPv>
    80003f6c:	01813083          	ld	ra,24(sp)
    80003f70:	01013403          	ld	s0,16(sp)
    80003f74:	00813483          	ld	s1,8(sp)
    80003f78:	02010113          	addi	sp,sp,32
    80003f7c:	00008067          	ret

0000000080003f80 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003f80:	ff010113          	addi	sp,sp,-16
    80003f84:	00113423          	sd	ra,8(sp)
    80003f88:	00813023          	sd	s0,0(sp)
    80003f8c:	01010413          	addi	s0,sp,16
    80003f90:	00007797          	auipc	a5,0x7
    80003f94:	6b878793          	addi	a5,a5,1720 # 8000b648 <_ZTV7WorkerB+0x10>
    80003f98:	00f53023          	sd	a5,0(a0)
    80003f9c:	ffffe097          	auipc	ra,0xffffe
    80003fa0:	f38080e7          	jalr	-200(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    80003fa4:	00813083          	ld	ra,8(sp)
    80003fa8:	00013403          	ld	s0,0(sp)
    80003fac:	01010113          	addi	sp,sp,16
    80003fb0:	00008067          	ret

0000000080003fb4 <_ZN7WorkerBD0Ev>:
    80003fb4:	fe010113          	addi	sp,sp,-32
    80003fb8:	00113c23          	sd	ra,24(sp)
    80003fbc:	00813823          	sd	s0,16(sp)
    80003fc0:	00913423          	sd	s1,8(sp)
    80003fc4:	02010413          	addi	s0,sp,32
    80003fc8:	00050493          	mv	s1,a0
    80003fcc:	00007797          	auipc	a5,0x7
    80003fd0:	67c78793          	addi	a5,a5,1660 # 8000b648 <_ZTV7WorkerB+0x10>
    80003fd4:	00f53023          	sd	a5,0(a0)
    80003fd8:	ffffe097          	auipc	ra,0xffffe
    80003fdc:	efc080e7          	jalr	-260(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    80003fe0:	00048513          	mv	a0,s1
    80003fe4:	ffffe097          	auipc	ra,0xffffe
    80003fe8:	ec8080e7          	jalr	-312(ra) # 80001eac <_ZdlPv>
    80003fec:	01813083          	ld	ra,24(sp)
    80003ff0:	01013403          	ld	s0,16(sp)
    80003ff4:	00813483          	ld	s1,8(sp)
    80003ff8:	02010113          	addi	sp,sp,32
    80003ffc:	00008067          	ret

0000000080004000 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004000:	ff010113          	addi	sp,sp,-16
    80004004:	00113423          	sd	ra,8(sp)
    80004008:	00813023          	sd	s0,0(sp)
    8000400c:	01010413          	addi	s0,sp,16
    80004010:	00007797          	auipc	a5,0x7
    80004014:	66078793          	addi	a5,a5,1632 # 8000b670 <_ZTV7WorkerC+0x10>
    80004018:	00f53023          	sd	a5,0(a0)
    8000401c:	ffffe097          	auipc	ra,0xffffe
    80004020:	eb8080e7          	jalr	-328(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    80004024:	00813083          	ld	ra,8(sp)
    80004028:	00013403          	ld	s0,0(sp)
    8000402c:	01010113          	addi	sp,sp,16
    80004030:	00008067          	ret

0000000080004034 <_ZN7WorkerCD0Ev>:
    80004034:	fe010113          	addi	sp,sp,-32
    80004038:	00113c23          	sd	ra,24(sp)
    8000403c:	00813823          	sd	s0,16(sp)
    80004040:	00913423          	sd	s1,8(sp)
    80004044:	02010413          	addi	s0,sp,32
    80004048:	00050493          	mv	s1,a0
    8000404c:	00007797          	auipc	a5,0x7
    80004050:	62478793          	addi	a5,a5,1572 # 8000b670 <_ZTV7WorkerC+0x10>
    80004054:	00f53023          	sd	a5,0(a0)
    80004058:	ffffe097          	auipc	ra,0xffffe
    8000405c:	e7c080e7          	jalr	-388(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    80004060:	00048513          	mv	a0,s1
    80004064:	ffffe097          	auipc	ra,0xffffe
    80004068:	e48080e7          	jalr	-440(ra) # 80001eac <_ZdlPv>
    8000406c:	01813083          	ld	ra,24(sp)
    80004070:	01013403          	ld	s0,16(sp)
    80004074:	00813483          	ld	s1,8(sp)
    80004078:	02010113          	addi	sp,sp,32
    8000407c:	00008067          	ret

0000000080004080 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004080:	ff010113          	addi	sp,sp,-16
    80004084:	00113423          	sd	ra,8(sp)
    80004088:	00813023          	sd	s0,0(sp)
    8000408c:	01010413          	addi	s0,sp,16
    80004090:	00007797          	auipc	a5,0x7
    80004094:	60878793          	addi	a5,a5,1544 # 8000b698 <_ZTV7WorkerD+0x10>
    80004098:	00f53023          	sd	a5,0(a0)
    8000409c:	ffffe097          	auipc	ra,0xffffe
    800040a0:	e38080e7          	jalr	-456(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    800040a4:	00813083          	ld	ra,8(sp)
    800040a8:	00013403          	ld	s0,0(sp)
    800040ac:	01010113          	addi	sp,sp,16
    800040b0:	00008067          	ret

00000000800040b4 <_ZN7WorkerDD0Ev>:
    800040b4:	fe010113          	addi	sp,sp,-32
    800040b8:	00113c23          	sd	ra,24(sp)
    800040bc:	00813823          	sd	s0,16(sp)
    800040c0:	00913423          	sd	s1,8(sp)
    800040c4:	02010413          	addi	s0,sp,32
    800040c8:	00050493          	mv	s1,a0
    800040cc:	00007797          	auipc	a5,0x7
    800040d0:	5cc78793          	addi	a5,a5,1484 # 8000b698 <_ZTV7WorkerD+0x10>
    800040d4:	00f53023          	sd	a5,0(a0)
    800040d8:	ffffe097          	auipc	ra,0xffffe
    800040dc:	dfc080e7          	jalr	-516(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    800040e0:	00048513          	mv	a0,s1
    800040e4:	ffffe097          	auipc	ra,0xffffe
    800040e8:	dc8080e7          	jalr	-568(ra) # 80001eac <_ZdlPv>
    800040ec:	01813083          	ld	ra,24(sp)
    800040f0:	01013403          	ld	s0,16(sp)
    800040f4:	00813483          	ld	s1,8(sp)
    800040f8:	02010113          	addi	sp,sp,32
    800040fc:	00008067          	ret

0000000080004100 <_ZN7WorkerA3runEv>:
    void run() override {
    80004100:	ff010113          	addi	sp,sp,-16
    80004104:	00113423          	sd	ra,8(sp)
    80004108:	00813023          	sd	s0,0(sp)
    8000410c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004110:	00000593          	li	a1,0
    80004114:	fffff097          	auipc	ra,0xfffff
    80004118:	774080e7          	jalr	1908(ra) # 80003888 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000411c:	00813083          	ld	ra,8(sp)
    80004120:	00013403          	ld	s0,0(sp)
    80004124:	01010113          	addi	sp,sp,16
    80004128:	00008067          	ret

000000008000412c <_ZN7WorkerB3runEv>:
    void run() override {
    8000412c:	ff010113          	addi	sp,sp,-16
    80004130:	00113423          	sd	ra,8(sp)
    80004134:	00813023          	sd	s0,0(sp)
    80004138:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000413c:	00000593          	li	a1,0
    80004140:	00000097          	auipc	ra,0x0
    80004144:	814080e7          	jalr	-2028(ra) # 80003954 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004148:	00813083          	ld	ra,8(sp)
    8000414c:	00013403          	ld	s0,0(sp)
    80004150:	01010113          	addi	sp,sp,16
    80004154:	00008067          	ret

0000000080004158 <_ZN7WorkerC3runEv>:
    void run() override {
    80004158:	ff010113          	addi	sp,sp,-16
    8000415c:	00113423          	sd	ra,8(sp)
    80004160:	00813023          	sd	s0,0(sp)
    80004164:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004168:	00000593          	li	a1,0
    8000416c:	00000097          	auipc	ra,0x0
    80004170:	8bc080e7          	jalr	-1860(ra) # 80003a28 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004174:	00813083          	ld	ra,8(sp)
    80004178:	00013403          	ld	s0,0(sp)
    8000417c:	01010113          	addi	sp,sp,16
    80004180:	00008067          	ret

0000000080004184 <_ZN7WorkerD3runEv>:
    void run() override {
    80004184:	ff010113          	addi	sp,sp,-16
    80004188:	00113423          	sd	ra,8(sp)
    8000418c:	00813023          	sd	s0,0(sp)
    80004190:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004194:	00000593          	li	a1,0
    80004198:	00000097          	auipc	ra,0x0
    8000419c:	a10080e7          	jalr	-1520(ra) # 80003ba8 <_ZN7WorkerD11workerBodyDEPv>
    }
    800041a0:	00813083          	ld	ra,8(sp)
    800041a4:	00013403          	ld	s0,0(sp)
    800041a8:	01010113          	addi	sp,sp,16
    800041ac:	00008067          	ret

00000000800041b0 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800041b0:	f8010113          	addi	sp,sp,-128
    800041b4:	06113c23          	sd	ra,120(sp)
    800041b8:	06813823          	sd	s0,112(sp)
    800041bc:	06913423          	sd	s1,104(sp)
    800041c0:	07213023          	sd	s2,96(sp)
    800041c4:	05313c23          	sd	s3,88(sp)
    800041c8:	05413823          	sd	s4,80(sp)
    800041cc:	05513423          	sd	s5,72(sp)
    800041d0:	05613023          	sd	s6,64(sp)
    800041d4:	03713c23          	sd	s7,56(sp)
    800041d8:	03813823          	sd	s8,48(sp)
    800041dc:	03913423          	sd	s9,40(sp)
    800041e0:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800041e4:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800041e8:	00005517          	auipc	a0,0x5
    800041ec:	f4850513          	addi	a0,a0,-184 # 80009130 <CONSOLE_STATUS+0x120>
    800041f0:	00001097          	auipc	ra,0x1
    800041f4:	5a8080e7          	jalr	1448(ra) # 80005798 <_Z11printStringPKc>
    getString(input, 30);
    800041f8:	01e00593          	li	a1,30
    800041fc:	f8040493          	addi	s1,s0,-128
    80004200:	00048513          	mv	a0,s1
    80004204:	00001097          	auipc	ra,0x1
    80004208:	61c080e7          	jalr	1564(ra) # 80005820 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000420c:	00048513          	mv	a0,s1
    80004210:	00001097          	auipc	ra,0x1
    80004214:	6e8080e7          	jalr	1768(ra) # 800058f8 <_Z11stringToIntPKc>
    80004218:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    8000421c:	00005517          	auipc	a0,0x5
    80004220:	f3450513          	addi	a0,a0,-204 # 80009150 <CONSOLE_STATUS+0x140>
    80004224:	00001097          	auipc	ra,0x1
    80004228:	574080e7          	jalr	1396(ra) # 80005798 <_Z11printStringPKc>
    getString(input, 30);
    8000422c:	01e00593          	li	a1,30
    80004230:	00048513          	mv	a0,s1
    80004234:	00001097          	auipc	ra,0x1
    80004238:	5ec080e7          	jalr	1516(ra) # 80005820 <_Z9getStringPci>
    n = stringToInt(input);
    8000423c:	00048513          	mv	a0,s1
    80004240:	00001097          	auipc	ra,0x1
    80004244:	6b8080e7          	jalr	1720(ra) # 800058f8 <_Z11stringToIntPKc>
    80004248:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    8000424c:	00005517          	auipc	a0,0x5
    80004250:	f2450513          	addi	a0,a0,-220 # 80009170 <CONSOLE_STATUS+0x160>
    80004254:	00001097          	auipc	ra,0x1
    80004258:	544080e7          	jalr	1348(ra) # 80005798 <_Z11printStringPKc>
    printInt(threadNum);
    8000425c:	00000613          	li	a2,0
    80004260:	00a00593          	li	a1,10
    80004264:	00098513          	mv	a0,s3
    80004268:	00001097          	auipc	ra,0x1
    8000426c:	6e0080e7          	jalr	1760(ra) # 80005948 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004270:	00005517          	auipc	a0,0x5
    80004274:	f1850513          	addi	a0,a0,-232 # 80009188 <CONSOLE_STATUS+0x178>
    80004278:	00001097          	auipc	ra,0x1
    8000427c:	520080e7          	jalr	1312(ra) # 80005798 <_Z11printStringPKc>
    printInt(n);
    80004280:	00000613          	li	a2,0
    80004284:	00a00593          	li	a1,10
    80004288:	00048513          	mv	a0,s1
    8000428c:	00001097          	auipc	ra,0x1
    80004290:	6bc080e7          	jalr	1724(ra) # 80005948 <_Z8printIntiii>
    printString(".\n");
    80004294:	00005517          	auipc	a0,0x5
    80004298:	f0c50513          	addi	a0,a0,-244 # 800091a0 <CONSOLE_STATUS+0x190>
    8000429c:	00001097          	auipc	ra,0x1
    800042a0:	4fc080e7          	jalr	1276(ra) # 80005798 <_Z11printStringPKc>
    if (threadNum > n) {
    800042a4:	0334c463          	blt	s1,s3,800042cc <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800042a8:	03305c63          	blez	s3,800042e0 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800042ac:	03800513          	li	a0,56
    800042b0:	ffffe097          	auipc	ra,0xffffe
    800042b4:	bac080e7          	jalr	-1108(ra) # 80001e5c <_Znwm>
    800042b8:	00050a93          	mv	s5,a0
    800042bc:	00048593          	mv	a1,s1
    800042c0:	00001097          	auipc	ra,0x1
    800042c4:	7a8080e7          	jalr	1960(ra) # 80005a68 <_ZN9BufferCPPC1Ei>
    800042c8:	0300006f          	j	800042f8 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800042cc:	00005517          	auipc	a0,0x5
    800042d0:	edc50513          	addi	a0,a0,-292 # 800091a8 <CONSOLE_STATUS+0x198>
    800042d4:	00001097          	auipc	ra,0x1
    800042d8:	4c4080e7          	jalr	1220(ra) # 80005798 <_Z11printStringPKc>
        return;
    800042dc:	0140006f          	j	800042f0 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800042e0:	00005517          	auipc	a0,0x5
    800042e4:	f0850513          	addi	a0,a0,-248 # 800091e8 <CONSOLE_STATUS+0x1d8>
    800042e8:	00001097          	auipc	ra,0x1
    800042ec:	4b0080e7          	jalr	1200(ra) # 80005798 <_Z11printStringPKc>
        return;
    800042f0:	000c0113          	mv	sp,s8
    800042f4:	2140006f          	j	80004508 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800042f8:	01000513          	li	a0,16
    800042fc:	ffffe097          	auipc	ra,0xffffe
    80004300:	b60080e7          	jalr	-1184(ra) # 80001e5c <_Znwm>
    80004304:	00050913          	mv	s2,a0
    80004308:	00000593          	li	a1,0
    8000430c:	ffffe097          	auipc	ra,0xffffe
    80004310:	dec080e7          	jalr	-532(ra) # 800020f8 <_ZN9SemaphoreC1Ej>
    80004314:	00008797          	auipc	a5,0x8
    80004318:	dd27ba23          	sd	s2,-556(a5) # 8000c0e8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    8000431c:	00399793          	slli	a5,s3,0x3
    80004320:	00f78793          	addi	a5,a5,15
    80004324:	ff07f793          	andi	a5,a5,-16
    80004328:	40f10133          	sub	sp,sp,a5
    8000432c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004330:	0019871b          	addiw	a4,s3,1
    80004334:	00171793          	slli	a5,a4,0x1
    80004338:	00e787b3          	add	a5,a5,a4
    8000433c:	00379793          	slli	a5,a5,0x3
    80004340:	00f78793          	addi	a5,a5,15
    80004344:	ff07f793          	andi	a5,a5,-16
    80004348:	40f10133          	sub	sp,sp,a5
    8000434c:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004350:	00199493          	slli	s1,s3,0x1
    80004354:	013484b3          	add	s1,s1,s3
    80004358:	00349493          	slli	s1,s1,0x3
    8000435c:	009b04b3          	add	s1,s6,s1
    80004360:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004364:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004368:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    8000436c:	02800513          	li	a0,40
    80004370:	ffffe097          	auipc	ra,0xffffe
    80004374:	aec080e7          	jalr	-1300(ra) # 80001e5c <_Znwm>
    80004378:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    8000437c:	ffffe097          	auipc	ra,0xffffe
    80004380:	c90080e7          	jalr	-880(ra) # 8000200c <_ZN6ThreadC1Ev>
    80004384:	00007797          	auipc	a5,0x7
    80004388:	38c78793          	addi	a5,a5,908 # 8000b710 <_ZTV8Consumer+0x10>
    8000438c:	00fbb023          	sd	a5,0(s7)
    80004390:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004394:	000b8513          	mv	a0,s7
    80004398:	ffffe097          	auipc	ra,0xffffe
    8000439c:	cac080e7          	jalr	-852(ra) # 80002044 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800043a0:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800043a4:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800043a8:	00008797          	auipc	a5,0x8
    800043ac:	d407b783          	ld	a5,-704(a5) # 8000c0e8 <_ZL10waitForAll>
    800043b0:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800043b4:	02800513          	li	a0,40
    800043b8:	ffffe097          	auipc	ra,0xffffe
    800043bc:	aa4080e7          	jalr	-1372(ra) # 80001e5c <_Znwm>
    800043c0:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800043c4:	ffffe097          	auipc	ra,0xffffe
    800043c8:	c48080e7          	jalr	-952(ra) # 8000200c <_ZN6ThreadC1Ev>
    800043cc:	00007797          	auipc	a5,0x7
    800043d0:	2f478793          	addi	a5,a5,756 # 8000b6c0 <_ZTV16ProducerKeyborad+0x10>
    800043d4:	00f4b023          	sd	a5,0(s1)
    800043d8:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800043dc:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800043e0:	00048513          	mv	a0,s1
    800043e4:	ffffe097          	auipc	ra,0xffffe
    800043e8:	c60080e7          	jalr	-928(ra) # 80002044 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800043ec:	00100913          	li	s2,1
    800043f0:	0300006f          	j	80004420 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800043f4:	00007797          	auipc	a5,0x7
    800043f8:	2f478793          	addi	a5,a5,756 # 8000b6e8 <_ZTV8Producer+0x10>
    800043fc:	00fcb023          	sd	a5,0(s9)
    80004400:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004404:	00391793          	slli	a5,s2,0x3
    80004408:	00fa07b3          	add	a5,s4,a5
    8000440c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004410:	000c8513          	mv	a0,s9
    80004414:	ffffe097          	auipc	ra,0xffffe
    80004418:	c30080e7          	jalr	-976(ra) # 80002044 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000441c:	0019091b          	addiw	s2,s2,1
    80004420:	05395263          	bge	s2,s3,80004464 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004424:	00191493          	slli	s1,s2,0x1
    80004428:	012484b3          	add	s1,s1,s2
    8000442c:	00349493          	slli	s1,s1,0x3
    80004430:	009b04b3          	add	s1,s6,s1
    80004434:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004438:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    8000443c:	00008797          	auipc	a5,0x8
    80004440:	cac7b783          	ld	a5,-852(a5) # 8000c0e8 <_ZL10waitForAll>
    80004444:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004448:	02800513          	li	a0,40
    8000444c:	ffffe097          	auipc	ra,0xffffe
    80004450:	a10080e7          	jalr	-1520(ra) # 80001e5c <_Znwm>
    80004454:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004458:	ffffe097          	auipc	ra,0xffffe
    8000445c:	bb4080e7          	jalr	-1100(ra) # 8000200c <_ZN6ThreadC1Ev>
    80004460:	f95ff06f          	j	800043f4 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004464:	ffffe097          	auipc	ra,0xffffe
    80004468:	c44080e7          	jalr	-956(ra) # 800020a8 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    8000446c:	00000493          	li	s1,0
    80004470:	0099ce63          	blt	s3,s1,8000448c <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004474:	00008517          	auipc	a0,0x8
    80004478:	c7453503          	ld	a0,-908(a0) # 8000c0e8 <_ZL10waitForAll>
    8000447c:	ffffe097          	auipc	ra,0xffffe
    80004480:	cb4080e7          	jalr	-844(ra) # 80002130 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004484:	0014849b          	addiw	s1,s1,1
    80004488:	fe9ff06f          	j	80004470 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    8000448c:	00008517          	auipc	a0,0x8
    80004490:	c5c53503          	ld	a0,-932(a0) # 8000c0e8 <_ZL10waitForAll>
    80004494:	00050863          	beqz	a0,800044a4 <_Z20testConsumerProducerv+0x2f4>
    80004498:	00053783          	ld	a5,0(a0)
    8000449c:	0087b783          	ld	a5,8(a5)
    800044a0:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800044a4:	00000493          	li	s1,0
    800044a8:	0080006f          	j	800044b0 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800044ac:	0014849b          	addiw	s1,s1,1
    800044b0:	0334d263          	bge	s1,s3,800044d4 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800044b4:	00349793          	slli	a5,s1,0x3
    800044b8:	00fa07b3          	add	a5,s4,a5
    800044bc:	0007b503          	ld	a0,0(a5)
    800044c0:	fe0506e3          	beqz	a0,800044ac <_Z20testConsumerProducerv+0x2fc>
    800044c4:	00053783          	ld	a5,0(a0)
    800044c8:	0087b783          	ld	a5,8(a5)
    800044cc:	000780e7          	jalr	a5
    800044d0:	fddff06f          	j	800044ac <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800044d4:	000b8a63          	beqz	s7,800044e8 <_Z20testConsumerProducerv+0x338>
    800044d8:	000bb783          	ld	a5,0(s7)
    800044dc:	0087b783          	ld	a5,8(a5)
    800044e0:	000b8513          	mv	a0,s7
    800044e4:	000780e7          	jalr	a5
    delete buffer;
    800044e8:	000a8e63          	beqz	s5,80004504 <_Z20testConsumerProducerv+0x354>
    800044ec:	000a8513          	mv	a0,s5
    800044f0:	00002097          	auipc	ra,0x2
    800044f4:	870080e7          	jalr	-1936(ra) # 80005d60 <_ZN9BufferCPPD1Ev>
    800044f8:	000a8513          	mv	a0,s5
    800044fc:	ffffe097          	auipc	ra,0xffffe
    80004500:	9b0080e7          	jalr	-1616(ra) # 80001eac <_ZdlPv>
    80004504:	000c0113          	mv	sp,s8
}
    80004508:	f8040113          	addi	sp,s0,-128
    8000450c:	07813083          	ld	ra,120(sp)
    80004510:	07013403          	ld	s0,112(sp)
    80004514:	06813483          	ld	s1,104(sp)
    80004518:	06013903          	ld	s2,96(sp)
    8000451c:	05813983          	ld	s3,88(sp)
    80004520:	05013a03          	ld	s4,80(sp)
    80004524:	04813a83          	ld	s5,72(sp)
    80004528:	04013b03          	ld	s6,64(sp)
    8000452c:	03813b83          	ld	s7,56(sp)
    80004530:	03013c03          	ld	s8,48(sp)
    80004534:	02813c83          	ld	s9,40(sp)
    80004538:	08010113          	addi	sp,sp,128
    8000453c:	00008067          	ret
    80004540:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004544:	000a8513          	mv	a0,s5
    80004548:	ffffe097          	auipc	ra,0xffffe
    8000454c:	964080e7          	jalr	-1692(ra) # 80001eac <_ZdlPv>
    80004550:	00048513          	mv	a0,s1
    80004554:	00009097          	auipc	ra,0x9
    80004558:	c94080e7          	jalr	-876(ra) # 8000d1e8 <_Unwind_Resume>
    8000455c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004560:	00090513          	mv	a0,s2
    80004564:	ffffe097          	auipc	ra,0xffffe
    80004568:	948080e7          	jalr	-1720(ra) # 80001eac <_ZdlPv>
    8000456c:	00048513          	mv	a0,s1
    80004570:	00009097          	auipc	ra,0x9
    80004574:	c78080e7          	jalr	-904(ra) # 8000d1e8 <_Unwind_Resume>
    80004578:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    8000457c:	000b8513          	mv	a0,s7
    80004580:	ffffe097          	auipc	ra,0xffffe
    80004584:	92c080e7          	jalr	-1748(ra) # 80001eac <_ZdlPv>
    80004588:	00048513          	mv	a0,s1
    8000458c:	00009097          	auipc	ra,0x9
    80004590:	c5c080e7          	jalr	-932(ra) # 8000d1e8 <_Unwind_Resume>
    80004594:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004598:	00048513          	mv	a0,s1
    8000459c:	ffffe097          	auipc	ra,0xffffe
    800045a0:	910080e7          	jalr	-1776(ra) # 80001eac <_ZdlPv>
    800045a4:	00090513          	mv	a0,s2
    800045a8:	00009097          	auipc	ra,0x9
    800045ac:	c40080e7          	jalr	-960(ra) # 8000d1e8 <_Unwind_Resume>
    800045b0:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800045b4:	000c8513          	mv	a0,s9
    800045b8:	ffffe097          	auipc	ra,0xffffe
    800045bc:	8f4080e7          	jalr	-1804(ra) # 80001eac <_ZdlPv>
    800045c0:	00048513          	mv	a0,s1
    800045c4:	00009097          	auipc	ra,0x9
    800045c8:	c24080e7          	jalr	-988(ra) # 8000d1e8 <_Unwind_Resume>

00000000800045cc <_ZN8Consumer3runEv>:
    void run() override {
    800045cc:	fd010113          	addi	sp,sp,-48
    800045d0:	02113423          	sd	ra,40(sp)
    800045d4:	02813023          	sd	s0,32(sp)
    800045d8:	00913c23          	sd	s1,24(sp)
    800045dc:	01213823          	sd	s2,16(sp)
    800045e0:	01313423          	sd	s3,8(sp)
    800045e4:	03010413          	addi	s0,sp,48
    800045e8:	00050913          	mv	s2,a0
        int i = 0;
    800045ec:	00000993          	li	s3,0
    800045f0:	0100006f          	j	80004600 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800045f4:	00a00513          	li	a0,10
    800045f8:	ffffe097          	auipc	ra,0xffffe
    800045fc:	bb8080e7          	jalr	-1096(ra) # 800021b0 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004600:	00008797          	auipc	a5,0x8
    80004604:	ae07a783          	lw	a5,-1312(a5) # 8000c0e0 <_ZL9threadEnd>
    80004608:	04079a63          	bnez	a5,8000465c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    8000460c:	02093783          	ld	a5,32(s2)
    80004610:	0087b503          	ld	a0,8(a5)
    80004614:	00001097          	auipc	ra,0x1
    80004618:	638080e7          	jalr	1592(ra) # 80005c4c <_ZN9BufferCPP3getEv>
            i++;
    8000461c:	0019849b          	addiw	s1,s3,1
    80004620:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004624:	0ff57513          	andi	a0,a0,255
    80004628:	ffffe097          	auipc	ra,0xffffe
    8000462c:	b88080e7          	jalr	-1144(ra) # 800021b0 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004630:	05000793          	li	a5,80
    80004634:	02f4e4bb          	remw	s1,s1,a5
    80004638:	fc0494e3          	bnez	s1,80004600 <_ZN8Consumer3runEv+0x34>
    8000463c:	fb9ff06f          	j	800045f4 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004640:	02093783          	ld	a5,32(s2)
    80004644:	0087b503          	ld	a0,8(a5)
    80004648:	00001097          	auipc	ra,0x1
    8000464c:	604080e7          	jalr	1540(ra) # 80005c4c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004650:	0ff57513          	andi	a0,a0,255
    80004654:	ffffe097          	auipc	ra,0xffffe
    80004658:	b5c080e7          	jalr	-1188(ra) # 800021b0 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    8000465c:	02093783          	ld	a5,32(s2)
    80004660:	0087b503          	ld	a0,8(a5)
    80004664:	00001097          	auipc	ra,0x1
    80004668:	674080e7          	jalr	1652(ra) # 80005cd8 <_ZN9BufferCPP6getCntEv>
    8000466c:	fca04ae3          	bgtz	a0,80004640 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004670:	02093783          	ld	a5,32(s2)
    80004674:	0107b503          	ld	a0,16(a5)
    80004678:	ffffe097          	auipc	ra,0xffffe
    8000467c:	ae4080e7          	jalr	-1308(ra) # 8000215c <_ZN9Semaphore6signalEv>
    }
    80004680:	02813083          	ld	ra,40(sp)
    80004684:	02013403          	ld	s0,32(sp)
    80004688:	01813483          	ld	s1,24(sp)
    8000468c:	01013903          	ld	s2,16(sp)
    80004690:	00813983          	ld	s3,8(sp)
    80004694:	03010113          	addi	sp,sp,48
    80004698:	00008067          	ret

000000008000469c <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    8000469c:	ff010113          	addi	sp,sp,-16
    800046a0:	00113423          	sd	ra,8(sp)
    800046a4:	00813023          	sd	s0,0(sp)
    800046a8:	01010413          	addi	s0,sp,16
    800046ac:	00007797          	auipc	a5,0x7
    800046b0:	06478793          	addi	a5,a5,100 # 8000b710 <_ZTV8Consumer+0x10>
    800046b4:	00f53023          	sd	a5,0(a0)
    800046b8:	ffffe097          	auipc	ra,0xffffe
    800046bc:	81c080e7          	jalr	-2020(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    800046c0:	00813083          	ld	ra,8(sp)
    800046c4:	00013403          	ld	s0,0(sp)
    800046c8:	01010113          	addi	sp,sp,16
    800046cc:	00008067          	ret

00000000800046d0 <_ZN8ConsumerD0Ev>:
    800046d0:	fe010113          	addi	sp,sp,-32
    800046d4:	00113c23          	sd	ra,24(sp)
    800046d8:	00813823          	sd	s0,16(sp)
    800046dc:	00913423          	sd	s1,8(sp)
    800046e0:	02010413          	addi	s0,sp,32
    800046e4:	00050493          	mv	s1,a0
    800046e8:	00007797          	auipc	a5,0x7
    800046ec:	02878793          	addi	a5,a5,40 # 8000b710 <_ZTV8Consumer+0x10>
    800046f0:	00f53023          	sd	a5,0(a0)
    800046f4:	ffffd097          	auipc	ra,0xffffd
    800046f8:	7e0080e7          	jalr	2016(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    800046fc:	00048513          	mv	a0,s1
    80004700:	ffffd097          	auipc	ra,0xffffd
    80004704:	7ac080e7          	jalr	1964(ra) # 80001eac <_ZdlPv>
    80004708:	01813083          	ld	ra,24(sp)
    8000470c:	01013403          	ld	s0,16(sp)
    80004710:	00813483          	ld	s1,8(sp)
    80004714:	02010113          	addi	sp,sp,32
    80004718:	00008067          	ret

000000008000471c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    8000471c:	ff010113          	addi	sp,sp,-16
    80004720:	00113423          	sd	ra,8(sp)
    80004724:	00813023          	sd	s0,0(sp)
    80004728:	01010413          	addi	s0,sp,16
    8000472c:	00007797          	auipc	a5,0x7
    80004730:	f9478793          	addi	a5,a5,-108 # 8000b6c0 <_ZTV16ProducerKeyborad+0x10>
    80004734:	00f53023          	sd	a5,0(a0)
    80004738:	ffffd097          	auipc	ra,0xffffd
    8000473c:	79c080e7          	jalr	1948(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    80004740:	00813083          	ld	ra,8(sp)
    80004744:	00013403          	ld	s0,0(sp)
    80004748:	01010113          	addi	sp,sp,16
    8000474c:	00008067          	ret

0000000080004750 <_ZN16ProducerKeyboradD0Ev>:
    80004750:	fe010113          	addi	sp,sp,-32
    80004754:	00113c23          	sd	ra,24(sp)
    80004758:	00813823          	sd	s0,16(sp)
    8000475c:	00913423          	sd	s1,8(sp)
    80004760:	02010413          	addi	s0,sp,32
    80004764:	00050493          	mv	s1,a0
    80004768:	00007797          	auipc	a5,0x7
    8000476c:	f5878793          	addi	a5,a5,-168 # 8000b6c0 <_ZTV16ProducerKeyborad+0x10>
    80004770:	00f53023          	sd	a5,0(a0)
    80004774:	ffffd097          	auipc	ra,0xffffd
    80004778:	760080e7          	jalr	1888(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    8000477c:	00048513          	mv	a0,s1
    80004780:	ffffd097          	auipc	ra,0xffffd
    80004784:	72c080e7          	jalr	1836(ra) # 80001eac <_ZdlPv>
    80004788:	01813083          	ld	ra,24(sp)
    8000478c:	01013403          	ld	s0,16(sp)
    80004790:	00813483          	ld	s1,8(sp)
    80004794:	02010113          	addi	sp,sp,32
    80004798:	00008067          	ret

000000008000479c <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    8000479c:	ff010113          	addi	sp,sp,-16
    800047a0:	00113423          	sd	ra,8(sp)
    800047a4:	00813023          	sd	s0,0(sp)
    800047a8:	01010413          	addi	s0,sp,16
    800047ac:	00007797          	auipc	a5,0x7
    800047b0:	f3c78793          	addi	a5,a5,-196 # 8000b6e8 <_ZTV8Producer+0x10>
    800047b4:	00f53023          	sd	a5,0(a0)
    800047b8:	ffffd097          	auipc	ra,0xffffd
    800047bc:	71c080e7          	jalr	1820(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    800047c0:	00813083          	ld	ra,8(sp)
    800047c4:	00013403          	ld	s0,0(sp)
    800047c8:	01010113          	addi	sp,sp,16
    800047cc:	00008067          	ret

00000000800047d0 <_ZN8ProducerD0Ev>:
    800047d0:	fe010113          	addi	sp,sp,-32
    800047d4:	00113c23          	sd	ra,24(sp)
    800047d8:	00813823          	sd	s0,16(sp)
    800047dc:	00913423          	sd	s1,8(sp)
    800047e0:	02010413          	addi	s0,sp,32
    800047e4:	00050493          	mv	s1,a0
    800047e8:	00007797          	auipc	a5,0x7
    800047ec:	f0078793          	addi	a5,a5,-256 # 8000b6e8 <_ZTV8Producer+0x10>
    800047f0:	00f53023          	sd	a5,0(a0)
    800047f4:	ffffd097          	auipc	ra,0xffffd
    800047f8:	6e0080e7          	jalr	1760(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    800047fc:	00048513          	mv	a0,s1
    80004800:	ffffd097          	auipc	ra,0xffffd
    80004804:	6ac080e7          	jalr	1708(ra) # 80001eac <_ZdlPv>
    80004808:	01813083          	ld	ra,24(sp)
    8000480c:	01013403          	ld	s0,16(sp)
    80004810:	00813483          	ld	s1,8(sp)
    80004814:	02010113          	addi	sp,sp,32
    80004818:	00008067          	ret

000000008000481c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    8000481c:	fe010113          	addi	sp,sp,-32
    80004820:	00113c23          	sd	ra,24(sp)
    80004824:	00813823          	sd	s0,16(sp)
    80004828:	00913423          	sd	s1,8(sp)
    8000482c:	02010413          	addi	s0,sp,32
    80004830:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004834:	ffffd097          	auipc	ra,0xffffd
    80004838:	f18080e7          	jalr	-232(ra) # 8000174c <_Z4getcv>
    8000483c:	0005059b          	sext.w	a1,a0
    80004840:	01b00793          	li	a5,27
    80004844:	00f58c63          	beq	a1,a5,8000485c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004848:	0204b783          	ld	a5,32(s1)
    8000484c:	0087b503          	ld	a0,8(a5)
    80004850:	00001097          	auipc	ra,0x1
    80004854:	36c080e7          	jalr	876(ra) # 80005bbc <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004858:	fddff06f          	j	80004834 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    8000485c:	00100793          	li	a5,1
    80004860:	00008717          	auipc	a4,0x8
    80004864:	88f72023          	sw	a5,-1920(a4) # 8000c0e0 <_ZL9threadEnd>
        td->buffer->put('!');
    80004868:	0204b783          	ld	a5,32(s1)
    8000486c:	02100593          	li	a1,33
    80004870:	0087b503          	ld	a0,8(a5)
    80004874:	00001097          	auipc	ra,0x1
    80004878:	348080e7          	jalr	840(ra) # 80005bbc <_ZN9BufferCPP3putEi>
        td->sem->signal();
    8000487c:	0204b783          	ld	a5,32(s1)
    80004880:	0107b503          	ld	a0,16(a5)
    80004884:	ffffe097          	auipc	ra,0xffffe
    80004888:	8d8080e7          	jalr	-1832(ra) # 8000215c <_ZN9Semaphore6signalEv>
    }
    8000488c:	01813083          	ld	ra,24(sp)
    80004890:	01013403          	ld	s0,16(sp)
    80004894:	00813483          	ld	s1,8(sp)
    80004898:	02010113          	addi	sp,sp,32
    8000489c:	00008067          	ret

00000000800048a0 <_ZN8Producer3runEv>:
    void run() override {
    800048a0:	fe010113          	addi	sp,sp,-32
    800048a4:	00113c23          	sd	ra,24(sp)
    800048a8:	00813823          	sd	s0,16(sp)
    800048ac:	00913423          	sd	s1,8(sp)
    800048b0:	01213023          	sd	s2,0(sp)
    800048b4:	02010413          	addi	s0,sp,32
    800048b8:	00050493          	mv	s1,a0
        int i = 0;
    800048bc:	00000913          	li	s2,0
        while (!threadEnd) {
    800048c0:	00008797          	auipc	a5,0x8
    800048c4:	8207a783          	lw	a5,-2016(a5) # 8000c0e0 <_ZL9threadEnd>
    800048c8:	04079263          	bnez	a5,8000490c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800048cc:	0204b783          	ld	a5,32(s1)
    800048d0:	0007a583          	lw	a1,0(a5)
    800048d4:	0305859b          	addiw	a1,a1,48
    800048d8:	0087b503          	ld	a0,8(a5)
    800048dc:	00001097          	auipc	ra,0x1
    800048e0:	2e0080e7          	jalr	736(ra) # 80005bbc <_ZN9BufferCPP3putEi>
            i++;
    800048e4:	0019071b          	addiw	a4,s2,1
    800048e8:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800048ec:	0204b783          	ld	a5,32(s1)
    800048f0:	0007a783          	lw	a5,0(a5)
    800048f4:	00e787bb          	addw	a5,a5,a4
    800048f8:	00500513          	li	a0,5
    800048fc:	02a7e53b          	remw	a0,a5,a0
    80004900:	ffffd097          	auipc	ra,0xffffd
    80004904:	7d0080e7          	jalr	2000(ra) # 800020d0 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004908:	fb9ff06f          	j	800048c0 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    8000490c:	0204b783          	ld	a5,32(s1)
    80004910:	0107b503          	ld	a0,16(a5)
    80004914:	ffffe097          	auipc	ra,0xffffe
    80004918:	848080e7          	jalr	-1976(ra) # 8000215c <_ZN9Semaphore6signalEv>
    }
    8000491c:	01813083          	ld	ra,24(sp)
    80004920:	01013403          	ld	s0,16(sp)
    80004924:	00813483          	ld	s1,8(sp)
    80004928:	00013903          	ld	s2,0(sp)
    8000492c:	02010113          	addi	sp,sp,32
    80004930:	00008067          	ret

0000000080004934 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004934:	fe010113          	addi	sp,sp,-32
    80004938:	00113c23          	sd	ra,24(sp)
    8000493c:	00813823          	sd	s0,16(sp)
    80004940:	00913423          	sd	s1,8(sp)
    80004944:	01213023          	sd	s2,0(sp)
    80004948:	02010413          	addi	s0,sp,32
    8000494c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004950:	00100793          	li	a5,1
    80004954:	02a7f863          	bgeu	a5,a0,80004984 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004958:	00a00793          	li	a5,10
    8000495c:	02f577b3          	remu	a5,a0,a5
    80004960:	02078e63          	beqz	a5,8000499c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004964:	fff48513          	addi	a0,s1,-1
    80004968:	00000097          	auipc	ra,0x0
    8000496c:	fcc080e7          	jalr	-52(ra) # 80004934 <_ZL9fibonaccim>
    80004970:	00050913          	mv	s2,a0
    80004974:	ffe48513          	addi	a0,s1,-2
    80004978:	00000097          	auipc	ra,0x0
    8000497c:	fbc080e7          	jalr	-68(ra) # 80004934 <_ZL9fibonaccim>
    80004980:	00a90533          	add	a0,s2,a0
}
    80004984:	01813083          	ld	ra,24(sp)
    80004988:	01013403          	ld	s0,16(sp)
    8000498c:	00813483          	ld	s1,8(sp)
    80004990:	00013903          	ld	s2,0(sp)
    80004994:	02010113          	addi	sp,sp,32
    80004998:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000499c:	ffffd097          	auipc	ra,0xffffd
    800049a0:	c38080e7          	jalr	-968(ra) # 800015d4 <_Z15thread_dispatchv>
    800049a4:	fc1ff06f          	j	80004964 <_ZL9fibonaccim+0x30>

00000000800049a8 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800049a8:	fe010113          	addi	sp,sp,-32
    800049ac:	00113c23          	sd	ra,24(sp)
    800049b0:	00813823          	sd	s0,16(sp)
    800049b4:	00913423          	sd	s1,8(sp)
    800049b8:	01213023          	sd	s2,0(sp)
    800049bc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800049c0:	00a00493          	li	s1,10
    800049c4:	0400006f          	j	80004a04 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800049c8:	00005517          	auipc	a0,0x5
    800049cc:	8c050513          	addi	a0,a0,-1856 # 80009288 <CONSOLE_STATUS+0x278>
    800049d0:	00001097          	auipc	ra,0x1
    800049d4:	dc8080e7          	jalr	-568(ra) # 80005798 <_Z11printStringPKc>
    800049d8:	00000613          	li	a2,0
    800049dc:	00a00593          	li	a1,10
    800049e0:	00048513          	mv	a0,s1
    800049e4:	00001097          	auipc	ra,0x1
    800049e8:	f64080e7          	jalr	-156(ra) # 80005948 <_Z8printIntiii>
    800049ec:	00005517          	auipc	a0,0x5
    800049f0:	a8c50513          	addi	a0,a0,-1396 # 80009478 <CONSOLE_STATUS+0x468>
    800049f4:	00001097          	auipc	ra,0x1
    800049f8:	da4080e7          	jalr	-604(ra) # 80005798 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800049fc:	0014849b          	addiw	s1,s1,1
    80004a00:	0ff4f493          	andi	s1,s1,255
    80004a04:	00c00793          	li	a5,12
    80004a08:	fc97f0e3          	bgeu	a5,s1,800049c8 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004a0c:	00005517          	auipc	a0,0x5
    80004a10:	88450513          	addi	a0,a0,-1916 # 80009290 <CONSOLE_STATUS+0x280>
    80004a14:	00001097          	auipc	ra,0x1
    80004a18:	d84080e7          	jalr	-636(ra) # 80005798 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004a1c:	00500313          	li	t1,5
    thread_dispatch();
    80004a20:	ffffd097          	auipc	ra,0xffffd
    80004a24:	bb4080e7          	jalr	-1100(ra) # 800015d4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004a28:	01000513          	li	a0,16
    80004a2c:	00000097          	auipc	ra,0x0
    80004a30:	f08080e7          	jalr	-248(ra) # 80004934 <_ZL9fibonaccim>
    80004a34:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004a38:	00005517          	auipc	a0,0x5
    80004a3c:	86850513          	addi	a0,a0,-1944 # 800092a0 <CONSOLE_STATUS+0x290>
    80004a40:	00001097          	auipc	ra,0x1
    80004a44:	d58080e7          	jalr	-680(ra) # 80005798 <_Z11printStringPKc>
    80004a48:	00000613          	li	a2,0
    80004a4c:	00a00593          	li	a1,10
    80004a50:	0009051b          	sext.w	a0,s2
    80004a54:	00001097          	auipc	ra,0x1
    80004a58:	ef4080e7          	jalr	-268(ra) # 80005948 <_Z8printIntiii>
    80004a5c:	00005517          	auipc	a0,0x5
    80004a60:	a1c50513          	addi	a0,a0,-1508 # 80009478 <CONSOLE_STATUS+0x468>
    80004a64:	00001097          	auipc	ra,0x1
    80004a68:	d34080e7          	jalr	-716(ra) # 80005798 <_Z11printStringPKc>
    80004a6c:	0400006f          	j	80004aac <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004a70:	00005517          	auipc	a0,0x5
    80004a74:	81850513          	addi	a0,a0,-2024 # 80009288 <CONSOLE_STATUS+0x278>
    80004a78:	00001097          	auipc	ra,0x1
    80004a7c:	d20080e7          	jalr	-736(ra) # 80005798 <_Z11printStringPKc>
    80004a80:	00000613          	li	a2,0
    80004a84:	00a00593          	li	a1,10
    80004a88:	00048513          	mv	a0,s1
    80004a8c:	00001097          	auipc	ra,0x1
    80004a90:	ebc080e7          	jalr	-324(ra) # 80005948 <_Z8printIntiii>
    80004a94:	00005517          	auipc	a0,0x5
    80004a98:	9e450513          	addi	a0,a0,-1564 # 80009478 <CONSOLE_STATUS+0x468>
    80004a9c:	00001097          	auipc	ra,0x1
    80004aa0:	cfc080e7          	jalr	-772(ra) # 80005798 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004aa4:	0014849b          	addiw	s1,s1,1
    80004aa8:	0ff4f493          	andi	s1,s1,255
    80004aac:	00f00793          	li	a5,15
    80004ab0:	fc97f0e3          	bgeu	a5,s1,80004a70 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004ab4:	00004517          	auipc	a0,0x4
    80004ab8:	7fc50513          	addi	a0,a0,2044 # 800092b0 <CONSOLE_STATUS+0x2a0>
    80004abc:	00001097          	auipc	ra,0x1
    80004ac0:	cdc080e7          	jalr	-804(ra) # 80005798 <_Z11printStringPKc>
    finishedD = true;
    80004ac4:	00100793          	li	a5,1
    80004ac8:	00007717          	auipc	a4,0x7
    80004acc:	62f70423          	sb	a5,1576(a4) # 8000c0f0 <_ZL9finishedD>
    thread_dispatch();
    80004ad0:	ffffd097          	auipc	ra,0xffffd
    80004ad4:	b04080e7          	jalr	-1276(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80004ad8:	01813083          	ld	ra,24(sp)
    80004adc:	01013403          	ld	s0,16(sp)
    80004ae0:	00813483          	ld	s1,8(sp)
    80004ae4:	00013903          	ld	s2,0(sp)
    80004ae8:	02010113          	addi	sp,sp,32
    80004aec:	00008067          	ret

0000000080004af0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004af0:	fe010113          	addi	sp,sp,-32
    80004af4:	00113c23          	sd	ra,24(sp)
    80004af8:	00813823          	sd	s0,16(sp)
    80004afc:	00913423          	sd	s1,8(sp)
    80004b00:	01213023          	sd	s2,0(sp)
    80004b04:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004b08:	00000493          	li	s1,0
    80004b0c:	0400006f          	j	80004b4c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004b10:	00004517          	auipc	a0,0x4
    80004b14:	73850513          	addi	a0,a0,1848 # 80009248 <CONSOLE_STATUS+0x238>
    80004b18:	00001097          	auipc	ra,0x1
    80004b1c:	c80080e7          	jalr	-896(ra) # 80005798 <_Z11printStringPKc>
    80004b20:	00000613          	li	a2,0
    80004b24:	00a00593          	li	a1,10
    80004b28:	00048513          	mv	a0,s1
    80004b2c:	00001097          	auipc	ra,0x1
    80004b30:	e1c080e7          	jalr	-484(ra) # 80005948 <_Z8printIntiii>
    80004b34:	00005517          	auipc	a0,0x5
    80004b38:	94450513          	addi	a0,a0,-1724 # 80009478 <CONSOLE_STATUS+0x468>
    80004b3c:	00001097          	auipc	ra,0x1
    80004b40:	c5c080e7          	jalr	-932(ra) # 80005798 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004b44:	0014849b          	addiw	s1,s1,1
    80004b48:	0ff4f493          	andi	s1,s1,255
    80004b4c:	00200793          	li	a5,2
    80004b50:	fc97f0e3          	bgeu	a5,s1,80004b10 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004b54:	00004517          	auipc	a0,0x4
    80004b58:	6fc50513          	addi	a0,a0,1788 # 80009250 <CONSOLE_STATUS+0x240>
    80004b5c:	00001097          	auipc	ra,0x1
    80004b60:	c3c080e7          	jalr	-964(ra) # 80005798 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004b64:	00700313          	li	t1,7
    thread_dispatch();
    80004b68:	ffffd097          	auipc	ra,0xffffd
    80004b6c:	a6c080e7          	jalr	-1428(ra) # 800015d4 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004b70:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004b74:	00004517          	auipc	a0,0x4
    80004b78:	6ec50513          	addi	a0,a0,1772 # 80009260 <CONSOLE_STATUS+0x250>
    80004b7c:	00001097          	auipc	ra,0x1
    80004b80:	c1c080e7          	jalr	-996(ra) # 80005798 <_Z11printStringPKc>
    80004b84:	00000613          	li	a2,0
    80004b88:	00a00593          	li	a1,10
    80004b8c:	0009051b          	sext.w	a0,s2
    80004b90:	00001097          	auipc	ra,0x1
    80004b94:	db8080e7          	jalr	-584(ra) # 80005948 <_Z8printIntiii>
    80004b98:	00005517          	auipc	a0,0x5
    80004b9c:	8e050513          	addi	a0,a0,-1824 # 80009478 <CONSOLE_STATUS+0x468>
    80004ba0:	00001097          	auipc	ra,0x1
    80004ba4:	bf8080e7          	jalr	-1032(ra) # 80005798 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004ba8:	00c00513          	li	a0,12
    80004bac:	00000097          	auipc	ra,0x0
    80004bb0:	d88080e7          	jalr	-632(ra) # 80004934 <_ZL9fibonaccim>
    80004bb4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004bb8:	00004517          	auipc	a0,0x4
    80004bbc:	6b050513          	addi	a0,a0,1712 # 80009268 <CONSOLE_STATUS+0x258>
    80004bc0:	00001097          	auipc	ra,0x1
    80004bc4:	bd8080e7          	jalr	-1064(ra) # 80005798 <_Z11printStringPKc>
    80004bc8:	00000613          	li	a2,0
    80004bcc:	00a00593          	li	a1,10
    80004bd0:	0009051b          	sext.w	a0,s2
    80004bd4:	00001097          	auipc	ra,0x1
    80004bd8:	d74080e7          	jalr	-652(ra) # 80005948 <_Z8printIntiii>
    80004bdc:	00005517          	auipc	a0,0x5
    80004be0:	89c50513          	addi	a0,a0,-1892 # 80009478 <CONSOLE_STATUS+0x468>
    80004be4:	00001097          	auipc	ra,0x1
    80004be8:	bb4080e7          	jalr	-1100(ra) # 80005798 <_Z11printStringPKc>
    80004bec:	0400006f          	j	80004c2c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004bf0:	00004517          	auipc	a0,0x4
    80004bf4:	65850513          	addi	a0,a0,1624 # 80009248 <CONSOLE_STATUS+0x238>
    80004bf8:	00001097          	auipc	ra,0x1
    80004bfc:	ba0080e7          	jalr	-1120(ra) # 80005798 <_Z11printStringPKc>
    80004c00:	00000613          	li	a2,0
    80004c04:	00a00593          	li	a1,10
    80004c08:	00048513          	mv	a0,s1
    80004c0c:	00001097          	auipc	ra,0x1
    80004c10:	d3c080e7          	jalr	-708(ra) # 80005948 <_Z8printIntiii>
    80004c14:	00005517          	auipc	a0,0x5
    80004c18:	86450513          	addi	a0,a0,-1948 # 80009478 <CONSOLE_STATUS+0x468>
    80004c1c:	00001097          	auipc	ra,0x1
    80004c20:	b7c080e7          	jalr	-1156(ra) # 80005798 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004c24:	0014849b          	addiw	s1,s1,1
    80004c28:	0ff4f493          	andi	s1,s1,255
    80004c2c:	00500793          	li	a5,5
    80004c30:	fc97f0e3          	bgeu	a5,s1,80004bf0 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80004c34:	00004517          	auipc	a0,0x4
    80004c38:	64450513          	addi	a0,a0,1604 # 80009278 <CONSOLE_STATUS+0x268>
    80004c3c:	00001097          	auipc	ra,0x1
    80004c40:	b5c080e7          	jalr	-1188(ra) # 80005798 <_Z11printStringPKc>
    finishedC = true;
    80004c44:	00100793          	li	a5,1
    80004c48:	00007717          	auipc	a4,0x7
    80004c4c:	4af704a3          	sb	a5,1193(a4) # 8000c0f1 <_ZL9finishedC>
    thread_dispatch();
    80004c50:	ffffd097          	auipc	ra,0xffffd
    80004c54:	984080e7          	jalr	-1660(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80004c58:	01813083          	ld	ra,24(sp)
    80004c5c:	01013403          	ld	s0,16(sp)
    80004c60:	00813483          	ld	s1,8(sp)
    80004c64:	00013903          	ld	s2,0(sp)
    80004c68:	02010113          	addi	sp,sp,32
    80004c6c:	00008067          	ret

0000000080004c70 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004c70:	fe010113          	addi	sp,sp,-32
    80004c74:	00113c23          	sd	ra,24(sp)
    80004c78:	00813823          	sd	s0,16(sp)
    80004c7c:	00913423          	sd	s1,8(sp)
    80004c80:	01213023          	sd	s2,0(sp)
    80004c84:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004c88:	00000913          	li	s2,0
    80004c8c:	0380006f          	j	80004cc4 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004c90:	ffffd097          	auipc	ra,0xffffd
    80004c94:	944080e7          	jalr	-1724(ra) # 800015d4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004c98:	00148493          	addi	s1,s1,1
    80004c9c:	000027b7          	lui	a5,0x2
    80004ca0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004ca4:	0097ee63          	bltu	a5,s1,80004cc0 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004ca8:	00000713          	li	a4,0
    80004cac:	000077b7          	lui	a5,0x7
    80004cb0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004cb4:	fce7eee3          	bltu	a5,a4,80004c90 <_ZL11workerBodyBPv+0x20>
    80004cb8:	00170713          	addi	a4,a4,1
    80004cbc:	ff1ff06f          	j	80004cac <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004cc0:	00190913          	addi	s2,s2,1
    80004cc4:	00f00793          	li	a5,15
    80004cc8:	0527e063          	bltu	a5,s2,80004d08 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004ccc:	00004517          	auipc	a0,0x4
    80004cd0:	56450513          	addi	a0,a0,1380 # 80009230 <CONSOLE_STATUS+0x220>
    80004cd4:	00001097          	auipc	ra,0x1
    80004cd8:	ac4080e7          	jalr	-1340(ra) # 80005798 <_Z11printStringPKc>
    80004cdc:	00000613          	li	a2,0
    80004ce0:	00a00593          	li	a1,10
    80004ce4:	0009051b          	sext.w	a0,s2
    80004ce8:	00001097          	auipc	ra,0x1
    80004cec:	c60080e7          	jalr	-928(ra) # 80005948 <_Z8printIntiii>
    80004cf0:	00004517          	auipc	a0,0x4
    80004cf4:	78850513          	addi	a0,a0,1928 # 80009478 <CONSOLE_STATUS+0x468>
    80004cf8:	00001097          	auipc	ra,0x1
    80004cfc:	aa0080e7          	jalr	-1376(ra) # 80005798 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004d00:	00000493          	li	s1,0
    80004d04:	f99ff06f          	j	80004c9c <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004d08:	00004517          	auipc	a0,0x4
    80004d0c:	53050513          	addi	a0,a0,1328 # 80009238 <CONSOLE_STATUS+0x228>
    80004d10:	00001097          	auipc	ra,0x1
    80004d14:	a88080e7          	jalr	-1400(ra) # 80005798 <_Z11printStringPKc>
    finishedB = true;
    80004d18:	00100793          	li	a5,1
    80004d1c:	00007717          	auipc	a4,0x7
    80004d20:	3cf70b23          	sb	a5,982(a4) # 8000c0f2 <_ZL9finishedB>
    thread_dispatch();
    80004d24:	ffffd097          	auipc	ra,0xffffd
    80004d28:	8b0080e7          	jalr	-1872(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80004d2c:	01813083          	ld	ra,24(sp)
    80004d30:	01013403          	ld	s0,16(sp)
    80004d34:	00813483          	ld	s1,8(sp)
    80004d38:	00013903          	ld	s2,0(sp)
    80004d3c:	02010113          	addi	sp,sp,32
    80004d40:	00008067          	ret

0000000080004d44 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004d44:	fe010113          	addi	sp,sp,-32
    80004d48:	00113c23          	sd	ra,24(sp)
    80004d4c:	00813823          	sd	s0,16(sp)
    80004d50:	00913423          	sd	s1,8(sp)
    80004d54:	01213023          	sd	s2,0(sp)
    80004d58:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004d5c:	00000913          	li	s2,0
    80004d60:	0380006f          	j	80004d98 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004d64:	ffffd097          	auipc	ra,0xffffd
    80004d68:	870080e7          	jalr	-1936(ra) # 800015d4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004d6c:	00148493          	addi	s1,s1,1
    80004d70:	000027b7          	lui	a5,0x2
    80004d74:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004d78:	0097ee63          	bltu	a5,s1,80004d94 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004d7c:	00000713          	li	a4,0
    80004d80:	000077b7          	lui	a5,0x7
    80004d84:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004d88:	fce7eee3          	bltu	a5,a4,80004d64 <_ZL11workerBodyAPv+0x20>
    80004d8c:	00170713          	addi	a4,a4,1
    80004d90:	ff1ff06f          	j	80004d80 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004d94:	00190913          	addi	s2,s2,1
    80004d98:	00900793          	li	a5,9
    80004d9c:	0527e063          	bltu	a5,s2,80004ddc <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004da0:	00004517          	auipc	a0,0x4
    80004da4:	47850513          	addi	a0,a0,1144 # 80009218 <CONSOLE_STATUS+0x208>
    80004da8:	00001097          	auipc	ra,0x1
    80004dac:	9f0080e7          	jalr	-1552(ra) # 80005798 <_Z11printStringPKc>
    80004db0:	00000613          	li	a2,0
    80004db4:	00a00593          	li	a1,10
    80004db8:	0009051b          	sext.w	a0,s2
    80004dbc:	00001097          	auipc	ra,0x1
    80004dc0:	b8c080e7          	jalr	-1140(ra) # 80005948 <_Z8printIntiii>
    80004dc4:	00004517          	auipc	a0,0x4
    80004dc8:	6b450513          	addi	a0,a0,1716 # 80009478 <CONSOLE_STATUS+0x468>
    80004dcc:	00001097          	auipc	ra,0x1
    80004dd0:	9cc080e7          	jalr	-1588(ra) # 80005798 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004dd4:	00000493          	li	s1,0
    80004dd8:	f99ff06f          	j	80004d70 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004ddc:	00004517          	auipc	a0,0x4
    80004de0:	44450513          	addi	a0,a0,1092 # 80009220 <CONSOLE_STATUS+0x210>
    80004de4:	00001097          	auipc	ra,0x1
    80004de8:	9b4080e7          	jalr	-1612(ra) # 80005798 <_Z11printStringPKc>
    finishedA = true;
    80004dec:	00100793          	li	a5,1
    80004df0:	00007717          	auipc	a4,0x7
    80004df4:	30f701a3          	sb	a5,771(a4) # 8000c0f3 <_ZL9finishedA>
}
    80004df8:	01813083          	ld	ra,24(sp)
    80004dfc:	01013403          	ld	s0,16(sp)
    80004e00:	00813483          	ld	s1,8(sp)
    80004e04:	00013903          	ld	s2,0(sp)
    80004e08:	02010113          	addi	sp,sp,32
    80004e0c:	00008067          	ret

0000000080004e10 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004e10:	fd010113          	addi	sp,sp,-48
    80004e14:	02113423          	sd	ra,40(sp)
    80004e18:	02813023          	sd	s0,32(sp)
    80004e1c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004e20:	00000613          	li	a2,0
    80004e24:	00000597          	auipc	a1,0x0
    80004e28:	f2058593          	addi	a1,a1,-224 # 80004d44 <_ZL11workerBodyAPv>
    80004e2c:	fd040513          	addi	a0,s0,-48
    80004e30:	ffffc097          	auipc	ra,0xffffc
    80004e34:	6fc080e7          	jalr	1788(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004e38:	00004517          	auipc	a0,0x4
    80004e3c:	48850513          	addi	a0,a0,1160 # 800092c0 <CONSOLE_STATUS+0x2b0>
    80004e40:	00001097          	auipc	ra,0x1
    80004e44:	958080e7          	jalr	-1704(ra) # 80005798 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80004e48:	00000613          	li	a2,0
    80004e4c:	00000597          	auipc	a1,0x0
    80004e50:	e2458593          	addi	a1,a1,-476 # 80004c70 <_ZL11workerBodyBPv>
    80004e54:	fd840513          	addi	a0,s0,-40
    80004e58:	ffffc097          	auipc	ra,0xffffc
    80004e5c:	6d4080e7          	jalr	1748(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004e60:	00004517          	auipc	a0,0x4
    80004e64:	47850513          	addi	a0,a0,1144 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80004e68:	00001097          	auipc	ra,0x1
    80004e6c:	930080e7          	jalr	-1744(ra) # 80005798 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004e70:	00000613          	li	a2,0
    80004e74:	00000597          	auipc	a1,0x0
    80004e78:	c7c58593          	addi	a1,a1,-900 # 80004af0 <_ZL11workerBodyCPv>
    80004e7c:	fe040513          	addi	a0,s0,-32
    80004e80:	ffffc097          	auipc	ra,0xffffc
    80004e84:	6ac080e7          	jalr	1708(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80004e88:	00004517          	auipc	a0,0x4
    80004e8c:	46850513          	addi	a0,a0,1128 # 800092f0 <CONSOLE_STATUS+0x2e0>
    80004e90:	00001097          	auipc	ra,0x1
    80004e94:	908080e7          	jalr	-1784(ra) # 80005798 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004e98:	00000613          	li	a2,0
    80004e9c:	00000597          	auipc	a1,0x0
    80004ea0:	b0c58593          	addi	a1,a1,-1268 # 800049a8 <_ZL11workerBodyDPv>
    80004ea4:	fe840513          	addi	a0,s0,-24
    80004ea8:	ffffc097          	auipc	ra,0xffffc
    80004eac:	684080e7          	jalr	1668(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80004eb0:	00004517          	auipc	a0,0x4
    80004eb4:	45850513          	addi	a0,a0,1112 # 80009308 <CONSOLE_STATUS+0x2f8>
    80004eb8:	00001097          	auipc	ra,0x1
    80004ebc:	8e0080e7          	jalr	-1824(ra) # 80005798 <_Z11printStringPKc>
    80004ec0:	00c0006f          	j	80004ecc <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004ec4:	ffffc097          	auipc	ra,0xffffc
    80004ec8:	710080e7          	jalr	1808(ra) # 800015d4 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004ecc:	00007797          	auipc	a5,0x7
    80004ed0:	2277c783          	lbu	a5,551(a5) # 8000c0f3 <_ZL9finishedA>
    80004ed4:	fe0788e3          	beqz	a5,80004ec4 <_Z18Threads_C_API_testv+0xb4>
    80004ed8:	00007797          	auipc	a5,0x7
    80004edc:	21a7c783          	lbu	a5,538(a5) # 8000c0f2 <_ZL9finishedB>
    80004ee0:	fe0782e3          	beqz	a5,80004ec4 <_Z18Threads_C_API_testv+0xb4>
    80004ee4:	00007797          	auipc	a5,0x7
    80004ee8:	20d7c783          	lbu	a5,525(a5) # 8000c0f1 <_ZL9finishedC>
    80004eec:	fc078ce3          	beqz	a5,80004ec4 <_Z18Threads_C_API_testv+0xb4>
    80004ef0:	00007797          	auipc	a5,0x7
    80004ef4:	2007c783          	lbu	a5,512(a5) # 8000c0f0 <_ZL9finishedD>
    80004ef8:	fc0786e3          	beqz	a5,80004ec4 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80004efc:	02813083          	ld	ra,40(sp)
    80004f00:	02013403          	ld	s0,32(sp)
    80004f04:	03010113          	addi	sp,sp,48
    80004f08:	00008067          	ret

0000000080004f0c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80004f0c:	fd010113          	addi	sp,sp,-48
    80004f10:	02113423          	sd	ra,40(sp)
    80004f14:	02813023          	sd	s0,32(sp)
    80004f18:	00913c23          	sd	s1,24(sp)
    80004f1c:	01213823          	sd	s2,16(sp)
    80004f20:	01313423          	sd	s3,8(sp)
    80004f24:	03010413          	addi	s0,sp,48
    80004f28:	00050993          	mv	s3,a0
    80004f2c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004f30:	00000913          	li	s2,0
    80004f34:	00c0006f          	j	80004f40 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004f38:	ffffd097          	auipc	ra,0xffffd
    80004f3c:	170080e7          	jalr	368(ra) # 800020a8 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80004f40:	ffffd097          	auipc	ra,0xffffd
    80004f44:	80c080e7          	jalr	-2036(ra) # 8000174c <_Z4getcv>
    80004f48:	0005059b          	sext.w	a1,a0
    80004f4c:	01b00793          	li	a5,27
    80004f50:	02f58a63          	beq	a1,a5,80004f84 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80004f54:	0084b503          	ld	a0,8(s1)
    80004f58:	00001097          	auipc	ra,0x1
    80004f5c:	c64080e7          	jalr	-924(ra) # 80005bbc <_ZN9BufferCPP3putEi>
        i++;
    80004f60:	0019071b          	addiw	a4,s2,1
    80004f64:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004f68:	0004a683          	lw	a3,0(s1)
    80004f6c:	0026979b          	slliw	a5,a3,0x2
    80004f70:	00d787bb          	addw	a5,a5,a3
    80004f74:	0017979b          	slliw	a5,a5,0x1
    80004f78:	02f767bb          	remw	a5,a4,a5
    80004f7c:	fc0792e3          	bnez	a5,80004f40 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80004f80:	fb9ff06f          	j	80004f38 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80004f84:	00100793          	li	a5,1
    80004f88:	00007717          	auipc	a4,0x7
    80004f8c:	16f72823          	sw	a5,368(a4) # 8000c0f8 <_ZL9threadEnd>
    td->buffer->put('!');
    80004f90:	0209b783          	ld	a5,32(s3)
    80004f94:	02100593          	li	a1,33
    80004f98:	0087b503          	ld	a0,8(a5)
    80004f9c:	00001097          	auipc	ra,0x1
    80004fa0:	c20080e7          	jalr	-992(ra) # 80005bbc <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80004fa4:	0104b503          	ld	a0,16(s1)
    80004fa8:	ffffd097          	auipc	ra,0xffffd
    80004fac:	1b4080e7          	jalr	436(ra) # 8000215c <_ZN9Semaphore6signalEv>
}
    80004fb0:	02813083          	ld	ra,40(sp)
    80004fb4:	02013403          	ld	s0,32(sp)
    80004fb8:	01813483          	ld	s1,24(sp)
    80004fbc:	01013903          	ld	s2,16(sp)
    80004fc0:	00813983          	ld	s3,8(sp)
    80004fc4:	03010113          	addi	sp,sp,48
    80004fc8:	00008067          	ret

0000000080004fcc <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80004fcc:	fe010113          	addi	sp,sp,-32
    80004fd0:	00113c23          	sd	ra,24(sp)
    80004fd4:	00813823          	sd	s0,16(sp)
    80004fd8:	00913423          	sd	s1,8(sp)
    80004fdc:	01213023          	sd	s2,0(sp)
    80004fe0:	02010413          	addi	s0,sp,32
    80004fe4:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004fe8:	00000913          	li	s2,0
    80004fec:	00c0006f          	j	80004ff8 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004ff0:	ffffd097          	auipc	ra,0xffffd
    80004ff4:	0b8080e7          	jalr	184(ra) # 800020a8 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80004ff8:	00007797          	auipc	a5,0x7
    80004ffc:	1007a783          	lw	a5,256(a5) # 8000c0f8 <_ZL9threadEnd>
    80005000:	02079e63          	bnez	a5,8000503c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005004:	0004a583          	lw	a1,0(s1)
    80005008:	0305859b          	addiw	a1,a1,48
    8000500c:	0084b503          	ld	a0,8(s1)
    80005010:	00001097          	auipc	ra,0x1
    80005014:	bac080e7          	jalr	-1108(ra) # 80005bbc <_ZN9BufferCPP3putEi>
        i++;
    80005018:	0019071b          	addiw	a4,s2,1
    8000501c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005020:	0004a683          	lw	a3,0(s1)
    80005024:	0026979b          	slliw	a5,a3,0x2
    80005028:	00d787bb          	addw	a5,a5,a3
    8000502c:	0017979b          	slliw	a5,a5,0x1
    80005030:	02f767bb          	remw	a5,a4,a5
    80005034:	fc0792e3          	bnez	a5,80004ff8 <_ZN12ProducerSync8producerEPv+0x2c>
    80005038:	fb9ff06f          	j	80004ff0 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    8000503c:	0104b503          	ld	a0,16(s1)
    80005040:	ffffd097          	auipc	ra,0xffffd
    80005044:	11c080e7          	jalr	284(ra) # 8000215c <_ZN9Semaphore6signalEv>
}
    80005048:	01813083          	ld	ra,24(sp)
    8000504c:	01013403          	ld	s0,16(sp)
    80005050:	00813483          	ld	s1,8(sp)
    80005054:	00013903          	ld	s2,0(sp)
    80005058:	02010113          	addi	sp,sp,32
    8000505c:	00008067          	ret

0000000080005060 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005060:	fd010113          	addi	sp,sp,-48
    80005064:	02113423          	sd	ra,40(sp)
    80005068:	02813023          	sd	s0,32(sp)
    8000506c:	00913c23          	sd	s1,24(sp)
    80005070:	01213823          	sd	s2,16(sp)
    80005074:	01313423          	sd	s3,8(sp)
    80005078:	01413023          	sd	s4,0(sp)
    8000507c:	03010413          	addi	s0,sp,48
    80005080:	00050993          	mv	s3,a0
    80005084:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005088:	00000a13          	li	s4,0
    8000508c:	01c0006f          	j	800050a8 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005090:	ffffd097          	auipc	ra,0xffffd
    80005094:	018080e7          	jalr	24(ra) # 800020a8 <_ZN6Thread8dispatchEv>
    80005098:	0500006f          	j	800050e8 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    8000509c:	00a00513          	li	a0,10
    800050a0:	ffffc097          	auipc	ra,0xffffc
    800050a4:	6e0080e7          	jalr	1760(ra) # 80001780 <_Z4putcc>
    while (!threadEnd) {
    800050a8:	00007797          	auipc	a5,0x7
    800050ac:	0507a783          	lw	a5,80(a5) # 8000c0f8 <_ZL9threadEnd>
    800050b0:	06079263          	bnez	a5,80005114 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800050b4:	00893503          	ld	a0,8(s2)
    800050b8:	00001097          	auipc	ra,0x1
    800050bc:	b94080e7          	jalr	-1132(ra) # 80005c4c <_ZN9BufferCPP3getEv>
        i++;
    800050c0:	001a049b          	addiw	s1,s4,1
    800050c4:	00048a1b          	sext.w	s4,s1
        putc(key);
    800050c8:	0ff57513          	andi	a0,a0,255
    800050cc:	ffffc097          	auipc	ra,0xffffc
    800050d0:	6b4080e7          	jalr	1716(ra) # 80001780 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800050d4:	00092703          	lw	a4,0(s2)
    800050d8:	0027179b          	slliw	a5,a4,0x2
    800050dc:	00e787bb          	addw	a5,a5,a4
    800050e0:	02f4e7bb          	remw	a5,s1,a5
    800050e4:	fa0786e3          	beqz	a5,80005090 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800050e8:	05000793          	li	a5,80
    800050ec:	02f4e4bb          	remw	s1,s1,a5
    800050f0:	fa049ce3          	bnez	s1,800050a8 <_ZN12ConsumerSync8consumerEPv+0x48>
    800050f4:	fa9ff06f          	j	8000509c <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800050f8:	0209b783          	ld	a5,32(s3)
    800050fc:	0087b503          	ld	a0,8(a5)
    80005100:	00001097          	auipc	ra,0x1
    80005104:	b4c080e7          	jalr	-1204(ra) # 80005c4c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005108:	0ff57513          	andi	a0,a0,255
    8000510c:	ffffd097          	auipc	ra,0xffffd
    80005110:	0a4080e7          	jalr	164(ra) # 800021b0 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005114:	0209b783          	ld	a5,32(s3)
    80005118:	0087b503          	ld	a0,8(a5)
    8000511c:	00001097          	auipc	ra,0x1
    80005120:	bbc080e7          	jalr	-1092(ra) # 80005cd8 <_ZN9BufferCPP6getCntEv>
    80005124:	fca04ae3          	bgtz	a0,800050f8 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005128:	01093503          	ld	a0,16(s2)
    8000512c:	ffffd097          	auipc	ra,0xffffd
    80005130:	030080e7          	jalr	48(ra) # 8000215c <_ZN9Semaphore6signalEv>
}
    80005134:	02813083          	ld	ra,40(sp)
    80005138:	02013403          	ld	s0,32(sp)
    8000513c:	01813483          	ld	s1,24(sp)
    80005140:	01013903          	ld	s2,16(sp)
    80005144:	00813983          	ld	s3,8(sp)
    80005148:	00013a03          	ld	s4,0(sp)
    8000514c:	03010113          	addi	sp,sp,48
    80005150:	00008067          	ret

0000000080005154 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005154:	f8010113          	addi	sp,sp,-128
    80005158:	06113c23          	sd	ra,120(sp)
    8000515c:	06813823          	sd	s0,112(sp)
    80005160:	06913423          	sd	s1,104(sp)
    80005164:	07213023          	sd	s2,96(sp)
    80005168:	05313c23          	sd	s3,88(sp)
    8000516c:	05413823          	sd	s4,80(sp)
    80005170:	05513423          	sd	s5,72(sp)
    80005174:	05613023          	sd	s6,64(sp)
    80005178:	03713c23          	sd	s7,56(sp)
    8000517c:	03813823          	sd	s8,48(sp)
    80005180:	03913423          	sd	s9,40(sp)
    80005184:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005188:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    8000518c:	00004517          	auipc	a0,0x4
    80005190:	fa450513          	addi	a0,a0,-92 # 80009130 <CONSOLE_STATUS+0x120>
    80005194:	00000097          	auipc	ra,0x0
    80005198:	604080e7          	jalr	1540(ra) # 80005798 <_Z11printStringPKc>
    getString(input, 30);
    8000519c:	01e00593          	li	a1,30
    800051a0:	f8040493          	addi	s1,s0,-128
    800051a4:	00048513          	mv	a0,s1
    800051a8:	00000097          	auipc	ra,0x0
    800051ac:	678080e7          	jalr	1656(ra) # 80005820 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800051b0:	00048513          	mv	a0,s1
    800051b4:	00000097          	auipc	ra,0x0
    800051b8:	744080e7          	jalr	1860(ra) # 800058f8 <_Z11stringToIntPKc>
    800051bc:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800051c0:	00004517          	auipc	a0,0x4
    800051c4:	f9050513          	addi	a0,a0,-112 # 80009150 <CONSOLE_STATUS+0x140>
    800051c8:	00000097          	auipc	ra,0x0
    800051cc:	5d0080e7          	jalr	1488(ra) # 80005798 <_Z11printStringPKc>
    getString(input, 30);
    800051d0:	01e00593          	li	a1,30
    800051d4:	00048513          	mv	a0,s1
    800051d8:	00000097          	auipc	ra,0x0
    800051dc:	648080e7          	jalr	1608(ra) # 80005820 <_Z9getStringPci>
    n = stringToInt(input);
    800051e0:	00048513          	mv	a0,s1
    800051e4:	00000097          	auipc	ra,0x0
    800051e8:	714080e7          	jalr	1812(ra) # 800058f8 <_Z11stringToIntPKc>
    800051ec:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800051f0:	00004517          	auipc	a0,0x4
    800051f4:	f8050513          	addi	a0,a0,-128 # 80009170 <CONSOLE_STATUS+0x160>
    800051f8:	00000097          	auipc	ra,0x0
    800051fc:	5a0080e7          	jalr	1440(ra) # 80005798 <_Z11printStringPKc>
    80005200:	00000613          	li	a2,0
    80005204:	00a00593          	li	a1,10
    80005208:	00090513          	mv	a0,s2
    8000520c:	00000097          	auipc	ra,0x0
    80005210:	73c080e7          	jalr	1852(ra) # 80005948 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005214:	00004517          	auipc	a0,0x4
    80005218:	f7450513          	addi	a0,a0,-140 # 80009188 <CONSOLE_STATUS+0x178>
    8000521c:	00000097          	auipc	ra,0x0
    80005220:	57c080e7          	jalr	1404(ra) # 80005798 <_Z11printStringPKc>
    80005224:	00000613          	li	a2,0
    80005228:	00a00593          	li	a1,10
    8000522c:	00048513          	mv	a0,s1
    80005230:	00000097          	auipc	ra,0x0
    80005234:	718080e7          	jalr	1816(ra) # 80005948 <_Z8printIntiii>
    printString(".\n");
    80005238:	00004517          	auipc	a0,0x4
    8000523c:	f6850513          	addi	a0,a0,-152 # 800091a0 <CONSOLE_STATUS+0x190>
    80005240:	00000097          	auipc	ra,0x0
    80005244:	558080e7          	jalr	1368(ra) # 80005798 <_Z11printStringPKc>
    if(threadNum > n) {
    80005248:	0324c463          	blt	s1,s2,80005270 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    8000524c:	03205c63          	blez	s2,80005284 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005250:	03800513          	li	a0,56
    80005254:	ffffd097          	auipc	ra,0xffffd
    80005258:	c08080e7          	jalr	-1016(ra) # 80001e5c <_Znwm>
    8000525c:	00050a93          	mv	s5,a0
    80005260:	00048593          	mv	a1,s1
    80005264:	00001097          	auipc	ra,0x1
    80005268:	804080e7          	jalr	-2044(ra) # 80005a68 <_ZN9BufferCPPC1Ei>
    8000526c:	0300006f          	j	8000529c <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005270:	00004517          	auipc	a0,0x4
    80005274:	f3850513          	addi	a0,a0,-200 # 800091a8 <CONSOLE_STATUS+0x198>
    80005278:	00000097          	auipc	ra,0x0
    8000527c:	520080e7          	jalr	1312(ra) # 80005798 <_Z11printStringPKc>
        return;
    80005280:	0140006f          	j	80005294 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005284:	00004517          	auipc	a0,0x4
    80005288:	f6450513          	addi	a0,a0,-156 # 800091e8 <CONSOLE_STATUS+0x1d8>
    8000528c:	00000097          	auipc	ra,0x0
    80005290:	50c080e7          	jalr	1292(ra) # 80005798 <_Z11printStringPKc>
        return;
    80005294:	000b8113          	mv	sp,s7
    80005298:	2380006f          	j	800054d0 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    8000529c:	01000513          	li	a0,16
    800052a0:	ffffd097          	auipc	ra,0xffffd
    800052a4:	bbc080e7          	jalr	-1092(ra) # 80001e5c <_Znwm>
    800052a8:	00050493          	mv	s1,a0
    800052ac:	00000593          	li	a1,0
    800052b0:	ffffd097          	auipc	ra,0xffffd
    800052b4:	e48080e7          	jalr	-440(ra) # 800020f8 <_ZN9SemaphoreC1Ej>
    800052b8:	00007797          	auipc	a5,0x7
    800052bc:	e497b423          	sd	s1,-440(a5) # 8000c100 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800052c0:	00391793          	slli	a5,s2,0x3
    800052c4:	00f78793          	addi	a5,a5,15
    800052c8:	ff07f793          	andi	a5,a5,-16
    800052cc:	40f10133          	sub	sp,sp,a5
    800052d0:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800052d4:	0019071b          	addiw	a4,s2,1
    800052d8:	00171793          	slli	a5,a4,0x1
    800052dc:	00e787b3          	add	a5,a5,a4
    800052e0:	00379793          	slli	a5,a5,0x3
    800052e4:	00f78793          	addi	a5,a5,15
    800052e8:	ff07f793          	andi	a5,a5,-16
    800052ec:	40f10133          	sub	sp,sp,a5
    800052f0:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800052f4:	00191c13          	slli	s8,s2,0x1
    800052f8:	012c07b3          	add	a5,s8,s2
    800052fc:	00379793          	slli	a5,a5,0x3
    80005300:	00fa07b3          	add	a5,s4,a5
    80005304:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005308:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    8000530c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005310:	02800513          	li	a0,40
    80005314:	ffffd097          	auipc	ra,0xffffd
    80005318:	b48080e7          	jalr	-1208(ra) # 80001e5c <_Znwm>
    8000531c:	00050b13          	mv	s6,a0
    80005320:	012c0c33          	add	s8,s8,s2
    80005324:	003c1c13          	slli	s8,s8,0x3
    80005328:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    8000532c:	ffffd097          	auipc	ra,0xffffd
    80005330:	ce0080e7          	jalr	-800(ra) # 8000200c <_ZN6ThreadC1Ev>
    80005334:	00006797          	auipc	a5,0x6
    80005338:	45478793          	addi	a5,a5,1108 # 8000b788 <_ZTV12ConsumerSync+0x10>
    8000533c:	00fb3023          	sd	a5,0(s6)
    80005340:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005344:	000b0513          	mv	a0,s6
    80005348:	ffffd097          	auipc	ra,0xffffd
    8000534c:	cfc080e7          	jalr	-772(ra) # 80002044 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005350:	00000493          	li	s1,0
    80005354:	0380006f          	j	8000538c <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005358:	00006797          	auipc	a5,0x6
    8000535c:	40878793          	addi	a5,a5,1032 # 8000b760 <_ZTV12ProducerSync+0x10>
    80005360:	00fcb023          	sd	a5,0(s9)
    80005364:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005368:	00349793          	slli	a5,s1,0x3
    8000536c:	00f987b3          	add	a5,s3,a5
    80005370:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005374:	00349793          	slli	a5,s1,0x3
    80005378:	00f987b3          	add	a5,s3,a5
    8000537c:	0007b503          	ld	a0,0(a5)
    80005380:	ffffd097          	auipc	ra,0xffffd
    80005384:	cc4080e7          	jalr	-828(ra) # 80002044 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005388:	0014849b          	addiw	s1,s1,1
    8000538c:	0b24d063          	bge	s1,s2,8000542c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005390:	00149793          	slli	a5,s1,0x1
    80005394:	009787b3          	add	a5,a5,s1
    80005398:	00379793          	slli	a5,a5,0x3
    8000539c:	00fa07b3          	add	a5,s4,a5
    800053a0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800053a4:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800053a8:	00007717          	auipc	a4,0x7
    800053ac:	d5873703          	ld	a4,-680(a4) # 8000c100 <_ZL10waitForAll>
    800053b0:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800053b4:	02905863          	blez	s1,800053e4 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800053b8:	02800513          	li	a0,40
    800053bc:	ffffd097          	auipc	ra,0xffffd
    800053c0:	aa0080e7          	jalr	-1376(ra) # 80001e5c <_Znwm>
    800053c4:	00050c93          	mv	s9,a0
    800053c8:	00149c13          	slli	s8,s1,0x1
    800053cc:	009c0c33          	add	s8,s8,s1
    800053d0:	003c1c13          	slli	s8,s8,0x3
    800053d4:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800053d8:	ffffd097          	auipc	ra,0xffffd
    800053dc:	c34080e7          	jalr	-972(ra) # 8000200c <_ZN6ThreadC1Ev>
    800053e0:	f79ff06f          	j	80005358 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800053e4:	02800513          	li	a0,40
    800053e8:	ffffd097          	auipc	ra,0xffffd
    800053ec:	a74080e7          	jalr	-1420(ra) # 80001e5c <_Znwm>
    800053f0:	00050c93          	mv	s9,a0
    800053f4:	00149c13          	slli	s8,s1,0x1
    800053f8:	009c0c33          	add	s8,s8,s1
    800053fc:	003c1c13          	slli	s8,s8,0x3
    80005400:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005404:	ffffd097          	auipc	ra,0xffffd
    80005408:	c08080e7          	jalr	-1016(ra) # 8000200c <_ZN6ThreadC1Ev>
    8000540c:	00006797          	auipc	a5,0x6
    80005410:	32c78793          	addi	a5,a5,812 # 8000b738 <_ZTV16ProducerKeyboard+0x10>
    80005414:	00fcb023          	sd	a5,0(s9)
    80005418:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    8000541c:	00349793          	slli	a5,s1,0x3
    80005420:	00f987b3          	add	a5,s3,a5
    80005424:	0197b023          	sd	s9,0(a5)
    80005428:	f4dff06f          	j	80005374 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    8000542c:	ffffd097          	auipc	ra,0xffffd
    80005430:	c7c080e7          	jalr	-900(ra) # 800020a8 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005434:	00000493          	li	s1,0
    80005438:	00994e63          	blt	s2,s1,80005454 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    8000543c:	00007517          	auipc	a0,0x7
    80005440:	cc453503          	ld	a0,-828(a0) # 8000c100 <_ZL10waitForAll>
    80005444:	ffffd097          	auipc	ra,0xffffd
    80005448:	cec080e7          	jalr	-788(ra) # 80002130 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000544c:	0014849b          	addiw	s1,s1,1
    80005450:	fe9ff06f          	j	80005438 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005454:	00000493          	li	s1,0
    80005458:	0080006f          	j	80005460 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    8000545c:	0014849b          	addiw	s1,s1,1
    80005460:	0324d263          	bge	s1,s2,80005484 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005464:	00349793          	slli	a5,s1,0x3
    80005468:	00f987b3          	add	a5,s3,a5
    8000546c:	0007b503          	ld	a0,0(a5)
    80005470:	fe0506e3          	beqz	a0,8000545c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005474:	00053783          	ld	a5,0(a0)
    80005478:	0087b783          	ld	a5,8(a5)
    8000547c:	000780e7          	jalr	a5
    80005480:	fddff06f          	j	8000545c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005484:	000b0a63          	beqz	s6,80005498 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005488:	000b3783          	ld	a5,0(s6)
    8000548c:	0087b783          	ld	a5,8(a5)
    80005490:	000b0513          	mv	a0,s6
    80005494:	000780e7          	jalr	a5
    delete waitForAll;
    80005498:	00007517          	auipc	a0,0x7
    8000549c:	c6853503          	ld	a0,-920(a0) # 8000c100 <_ZL10waitForAll>
    800054a0:	00050863          	beqz	a0,800054b0 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800054a4:	00053783          	ld	a5,0(a0)
    800054a8:	0087b783          	ld	a5,8(a5)
    800054ac:	000780e7          	jalr	a5
    delete buffer;
    800054b0:	000a8e63          	beqz	s5,800054cc <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800054b4:	000a8513          	mv	a0,s5
    800054b8:	00001097          	auipc	ra,0x1
    800054bc:	8a8080e7          	jalr	-1880(ra) # 80005d60 <_ZN9BufferCPPD1Ev>
    800054c0:	000a8513          	mv	a0,s5
    800054c4:	ffffd097          	auipc	ra,0xffffd
    800054c8:	9e8080e7          	jalr	-1560(ra) # 80001eac <_ZdlPv>
    800054cc:	000b8113          	mv	sp,s7

}
    800054d0:	f8040113          	addi	sp,s0,-128
    800054d4:	07813083          	ld	ra,120(sp)
    800054d8:	07013403          	ld	s0,112(sp)
    800054dc:	06813483          	ld	s1,104(sp)
    800054e0:	06013903          	ld	s2,96(sp)
    800054e4:	05813983          	ld	s3,88(sp)
    800054e8:	05013a03          	ld	s4,80(sp)
    800054ec:	04813a83          	ld	s5,72(sp)
    800054f0:	04013b03          	ld	s6,64(sp)
    800054f4:	03813b83          	ld	s7,56(sp)
    800054f8:	03013c03          	ld	s8,48(sp)
    800054fc:	02813c83          	ld	s9,40(sp)
    80005500:	08010113          	addi	sp,sp,128
    80005504:	00008067          	ret
    80005508:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000550c:	000a8513          	mv	a0,s5
    80005510:	ffffd097          	auipc	ra,0xffffd
    80005514:	99c080e7          	jalr	-1636(ra) # 80001eac <_ZdlPv>
    80005518:	00048513          	mv	a0,s1
    8000551c:	00008097          	auipc	ra,0x8
    80005520:	ccc080e7          	jalr	-820(ra) # 8000d1e8 <_Unwind_Resume>
    80005524:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005528:	00048513          	mv	a0,s1
    8000552c:	ffffd097          	auipc	ra,0xffffd
    80005530:	980080e7          	jalr	-1664(ra) # 80001eac <_ZdlPv>
    80005534:	00090513          	mv	a0,s2
    80005538:	00008097          	auipc	ra,0x8
    8000553c:	cb0080e7          	jalr	-848(ra) # 8000d1e8 <_Unwind_Resume>
    80005540:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005544:	000b0513          	mv	a0,s6
    80005548:	ffffd097          	auipc	ra,0xffffd
    8000554c:	964080e7          	jalr	-1692(ra) # 80001eac <_ZdlPv>
    80005550:	00048513          	mv	a0,s1
    80005554:	00008097          	auipc	ra,0x8
    80005558:	c94080e7          	jalr	-876(ra) # 8000d1e8 <_Unwind_Resume>
    8000555c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005560:	000c8513          	mv	a0,s9
    80005564:	ffffd097          	auipc	ra,0xffffd
    80005568:	948080e7          	jalr	-1720(ra) # 80001eac <_ZdlPv>
    8000556c:	00048513          	mv	a0,s1
    80005570:	00008097          	auipc	ra,0x8
    80005574:	c78080e7          	jalr	-904(ra) # 8000d1e8 <_Unwind_Resume>
    80005578:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    8000557c:	000c8513          	mv	a0,s9
    80005580:	ffffd097          	auipc	ra,0xffffd
    80005584:	92c080e7          	jalr	-1748(ra) # 80001eac <_ZdlPv>
    80005588:	00048513          	mv	a0,s1
    8000558c:	00008097          	auipc	ra,0x8
    80005590:	c5c080e7          	jalr	-932(ra) # 8000d1e8 <_Unwind_Resume>

0000000080005594 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005594:	ff010113          	addi	sp,sp,-16
    80005598:	00113423          	sd	ra,8(sp)
    8000559c:	00813023          	sd	s0,0(sp)
    800055a0:	01010413          	addi	s0,sp,16
    800055a4:	00006797          	auipc	a5,0x6
    800055a8:	1e478793          	addi	a5,a5,484 # 8000b788 <_ZTV12ConsumerSync+0x10>
    800055ac:	00f53023          	sd	a5,0(a0)
    800055b0:	ffffd097          	auipc	ra,0xffffd
    800055b4:	924080e7          	jalr	-1756(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    800055b8:	00813083          	ld	ra,8(sp)
    800055bc:	00013403          	ld	s0,0(sp)
    800055c0:	01010113          	addi	sp,sp,16
    800055c4:	00008067          	ret

00000000800055c8 <_ZN12ConsumerSyncD0Ev>:
    800055c8:	fe010113          	addi	sp,sp,-32
    800055cc:	00113c23          	sd	ra,24(sp)
    800055d0:	00813823          	sd	s0,16(sp)
    800055d4:	00913423          	sd	s1,8(sp)
    800055d8:	02010413          	addi	s0,sp,32
    800055dc:	00050493          	mv	s1,a0
    800055e0:	00006797          	auipc	a5,0x6
    800055e4:	1a878793          	addi	a5,a5,424 # 8000b788 <_ZTV12ConsumerSync+0x10>
    800055e8:	00f53023          	sd	a5,0(a0)
    800055ec:	ffffd097          	auipc	ra,0xffffd
    800055f0:	8e8080e7          	jalr	-1816(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    800055f4:	00048513          	mv	a0,s1
    800055f8:	ffffd097          	auipc	ra,0xffffd
    800055fc:	8b4080e7          	jalr	-1868(ra) # 80001eac <_ZdlPv>
    80005600:	01813083          	ld	ra,24(sp)
    80005604:	01013403          	ld	s0,16(sp)
    80005608:	00813483          	ld	s1,8(sp)
    8000560c:	02010113          	addi	sp,sp,32
    80005610:	00008067          	ret

0000000080005614 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005614:	ff010113          	addi	sp,sp,-16
    80005618:	00113423          	sd	ra,8(sp)
    8000561c:	00813023          	sd	s0,0(sp)
    80005620:	01010413          	addi	s0,sp,16
    80005624:	00006797          	auipc	a5,0x6
    80005628:	13c78793          	addi	a5,a5,316 # 8000b760 <_ZTV12ProducerSync+0x10>
    8000562c:	00f53023          	sd	a5,0(a0)
    80005630:	ffffd097          	auipc	ra,0xffffd
    80005634:	8a4080e7          	jalr	-1884(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    80005638:	00813083          	ld	ra,8(sp)
    8000563c:	00013403          	ld	s0,0(sp)
    80005640:	01010113          	addi	sp,sp,16
    80005644:	00008067          	ret

0000000080005648 <_ZN12ProducerSyncD0Ev>:
    80005648:	fe010113          	addi	sp,sp,-32
    8000564c:	00113c23          	sd	ra,24(sp)
    80005650:	00813823          	sd	s0,16(sp)
    80005654:	00913423          	sd	s1,8(sp)
    80005658:	02010413          	addi	s0,sp,32
    8000565c:	00050493          	mv	s1,a0
    80005660:	00006797          	auipc	a5,0x6
    80005664:	10078793          	addi	a5,a5,256 # 8000b760 <_ZTV12ProducerSync+0x10>
    80005668:	00f53023          	sd	a5,0(a0)
    8000566c:	ffffd097          	auipc	ra,0xffffd
    80005670:	868080e7          	jalr	-1944(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    80005674:	00048513          	mv	a0,s1
    80005678:	ffffd097          	auipc	ra,0xffffd
    8000567c:	834080e7          	jalr	-1996(ra) # 80001eac <_ZdlPv>
    80005680:	01813083          	ld	ra,24(sp)
    80005684:	01013403          	ld	s0,16(sp)
    80005688:	00813483          	ld	s1,8(sp)
    8000568c:	02010113          	addi	sp,sp,32
    80005690:	00008067          	ret

0000000080005694 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005694:	ff010113          	addi	sp,sp,-16
    80005698:	00113423          	sd	ra,8(sp)
    8000569c:	00813023          	sd	s0,0(sp)
    800056a0:	01010413          	addi	s0,sp,16
    800056a4:	00006797          	auipc	a5,0x6
    800056a8:	09478793          	addi	a5,a5,148 # 8000b738 <_ZTV16ProducerKeyboard+0x10>
    800056ac:	00f53023          	sd	a5,0(a0)
    800056b0:	ffffd097          	auipc	ra,0xffffd
    800056b4:	824080e7          	jalr	-2012(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    800056b8:	00813083          	ld	ra,8(sp)
    800056bc:	00013403          	ld	s0,0(sp)
    800056c0:	01010113          	addi	sp,sp,16
    800056c4:	00008067          	ret

00000000800056c8 <_ZN16ProducerKeyboardD0Ev>:
    800056c8:	fe010113          	addi	sp,sp,-32
    800056cc:	00113c23          	sd	ra,24(sp)
    800056d0:	00813823          	sd	s0,16(sp)
    800056d4:	00913423          	sd	s1,8(sp)
    800056d8:	02010413          	addi	s0,sp,32
    800056dc:	00050493          	mv	s1,a0
    800056e0:	00006797          	auipc	a5,0x6
    800056e4:	05878793          	addi	a5,a5,88 # 8000b738 <_ZTV16ProducerKeyboard+0x10>
    800056e8:	00f53023          	sd	a5,0(a0)
    800056ec:	ffffc097          	auipc	ra,0xffffc
    800056f0:	7e8080e7          	jalr	2024(ra) # 80001ed4 <_ZN6ThreadD1Ev>
    800056f4:	00048513          	mv	a0,s1
    800056f8:	ffffc097          	auipc	ra,0xffffc
    800056fc:	7b4080e7          	jalr	1972(ra) # 80001eac <_ZdlPv>
    80005700:	01813083          	ld	ra,24(sp)
    80005704:	01013403          	ld	s0,16(sp)
    80005708:	00813483          	ld	s1,8(sp)
    8000570c:	02010113          	addi	sp,sp,32
    80005710:	00008067          	ret

0000000080005714 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005714:	ff010113          	addi	sp,sp,-16
    80005718:	00113423          	sd	ra,8(sp)
    8000571c:	00813023          	sd	s0,0(sp)
    80005720:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005724:	02053583          	ld	a1,32(a0)
    80005728:	fffff097          	auipc	ra,0xfffff
    8000572c:	7e4080e7          	jalr	2020(ra) # 80004f0c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005730:	00813083          	ld	ra,8(sp)
    80005734:	00013403          	ld	s0,0(sp)
    80005738:	01010113          	addi	sp,sp,16
    8000573c:	00008067          	ret

0000000080005740 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005740:	ff010113          	addi	sp,sp,-16
    80005744:	00113423          	sd	ra,8(sp)
    80005748:	00813023          	sd	s0,0(sp)
    8000574c:	01010413          	addi	s0,sp,16
        producer(td);
    80005750:	02053583          	ld	a1,32(a0)
    80005754:	00000097          	auipc	ra,0x0
    80005758:	878080e7          	jalr	-1928(ra) # 80004fcc <_ZN12ProducerSync8producerEPv>
    }
    8000575c:	00813083          	ld	ra,8(sp)
    80005760:	00013403          	ld	s0,0(sp)
    80005764:	01010113          	addi	sp,sp,16
    80005768:	00008067          	ret

000000008000576c <_ZN12ConsumerSync3runEv>:
    void run() override {
    8000576c:	ff010113          	addi	sp,sp,-16
    80005770:	00113423          	sd	ra,8(sp)
    80005774:	00813023          	sd	s0,0(sp)
    80005778:	01010413          	addi	s0,sp,16
        consumer(td);
    8000577c:	02053583          	ld	a1,32(a0)
    80005780:	00000097          	auipc	ra,0x0
    80005784:	8e0080e7          	jalr	-1824(ra) # 80005060 <_ZN12ConsumerSync8consumerEPv>
    }
    80005788:	00813083          	ld	ra,8(sp)
    8000578c:	00013403          	ld	s0,0(sp)
    80005790:	01010113          	addi	sp,sp,16
    80005794:	00008067          	ret

0000000080005798 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005798:	fe010113          	addi	sp,sp,-32
    8000579c:	00113c23          	sd	ra,24(sp)
    800057a0:	00813823          	sd	s0,16(sp)
    800057a4:	00913423          	sd	s1,8(sp)
    800057a8:	02010413          	addi	s0,sp,32
    800057ac:	00050493          	mv	s1,a0
    LOCK();
    800057b0:	00100613          	li	a2,1
    800057b4:	00000593          	li	a1,0
    800057b8:	00007517          	auipc	a0,0x7
    800057bc:	95050513          	addi	a0,a0,-1712 # 8000c108 <lockPrint>
    800057c0:	ffffc097          	auipc	ra,0xffffc
    800057c4:	ca4080e7          	jalr	-860(ra) # 80001464 <copy_and_swap>
    800057c8:	00050863          	beqz	a0,800057d8 <_Z11printStringPKc+0x40>
    800057cc:	ffffc097          	auipc	ra,0xffffc
    800057d0:	e08080e7          	jalr	-504(ra) # 800015d4 <_Z15thread_dispatchv>
    800057d4:	fddff06f          	j	800057b0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800057d8:	0004c503          	lbu	a0,0(s1)
    800057dc:	00050a63          	beqz	a0,800057f0 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800057e0:	ffffc097          	auipc	ra,0xffffc
    800057e4:	fa0080e7          	jalr	-96(ra) # 80001780 <_Z4putcc>
        string++;
    800057e8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800057ec:	fedff06f          	j	800057d8 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800057f0:	00000613          	li	a2,0
    800057f4:	00100593          	li	a1,1
    800057f8:	00007517          	auipc	a0,0x7
    800057fc:	91050513          	addi	a0,a0,-1776 # 8000c108 <lockPrint>
    80005800:	ffffc097          	auipc	ra,0xffffc
    80005804:	c64080e7          	jalr	-924(ra) # 80001464 <copy_and_swap>
    80005808:	fe0514e3          	bnez	a0,800057f0 <_Z11printStringPKc+0x58>
}
    8000580c:	01813083          	ld	ra,24(sp)
    80005810:	01013403          	ld	s0,16(sp)
    80005814:	00813483          	ld	s1,8(sp)
    80005818:	02010113          	addi	sp,sp,32
    8000581c:	00008067          	ret

0000000080005820 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005820:	fd010113          	addi	sp,sp,-48
    80005824:	02113423          	sd	ra,40(sp)
    80005828:	02813023          	sd	s0,32(sp)
    8000582c:	00913c23          	sd	s1,24(sp)
    80005830:	01213823          	sd	s2,16(sp)
    80005834:	01313423          	sd	s3,8(sp)
    80005838:	01413023          	sd	s4,0(sp)
    8000583c:	03010413          	addi	s0,sp,48
    80005840:	00050993          	mv	s3,a0
    80005844:	00058a13          	mv	s4,a1
    LOCK();
    80005848:	00100613          	li	a2,1
    8000584c:	00000593          	li	a1,0
    80005850:	00007517          	auipc	a0,0x7
    80005854:	8b850513          	addi	a0,a0,-1864 # 8000c108 <lockPrint>
    80005858:	ffffc097          	auipc	ra,0xffffc
    8000585c:	c0c080e7          	jalr	-1012(ra) # 80001464 <copy_and_swap>
    80005860:	00050863          	beqz	a0,80005870 <_Z9getStringPci+0x50>
    80005864:	ffffc097          	auipc	ra,0xffffc
    80005868:	d70080e7          	jalr	-656(ra) # 800015d4 <_Z15thread_dispatchv>
    8000586c:	fddff06f          	j	80005848 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005870:	00000913          	li	s2,0
    80005874:	00090493          	mv	s1,s2
    80005878:	0019091b          	addiw	s2,s2,1
    8000587c:	03495a63          	bge	s2,s4,800058b0 <_Z9getStringPci+0x90>
        cc = getc();
    80005880:	ffffc097          	auipc	ra,0xffffc
    80005884:	ecc080e7          	jalr	-308(ra) # 8000174c <_Z4getcv>
        if(cc < 1)
    80005888:	02050463          	beqz	a0,800058b0 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    8000588c:	009984b3          	add	s1,s3,s1
    80005890:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005894:	00a00793          	li	a5,10
    80005898:	00f50a63          	beq	a0,a5,800058ac <_Z9getStringPci+0x8c>
    8000589c:	00d00793          	li	a5,13
    800058a0:	fcf51ae3          	bne	a0,a5,80005874 <_Z9getStringPci+0x54>
        buf[i++] = c;
    800058a4:	00090493          	mv	s1,s2
    800058a8:	0080006f          	j	800058b0 <_Z9getStringPci+0x90>
    800058ac:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800058b0:	009984b3          	add	s1,s3,s1
    800058b4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800058b8:	00000613          	li	a2,0
    800058bc:	00100593          	li	a1,1
    800058c0:	00007517          	auipc	a0,0x7
    800058c4:	84850513          	addi	a0,a0,-1976 # 8000c108 <lockPrint>
    800058c8:	ffffc097          	auipc	ra,0xffffc
    800058cc:	b9c080e7          	jalr	-1124(ra) # 80001464 <copy_and_swap>
    800058d0:	fe0514e3          	bnez	a0,800058b8 <_Z9getStringPci+0x98>
    return buf;
}
    800058d4:	00098513          	mv	a0,s3
    800058d8:	02813083          	ld	ra,40(sp)
    800058dc:	02013403          	ld	s0,32(sp)
    800058e0:	01813483          	ld	s1,24(sp)
    800058e4:	01013903          	ld	s2,16(sp)
    800058e8:	00813983          	ld	s3,8(sp)
    800058ec:	00013a03          	ld	s4,0(sp)
    800058f0:	03010113          	addi	sp,sp,48
    800058f4:	00008067          	ret

00000000800058f8 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800058f8:	ff010113          	addi	sp,sp,-16
    800058fc:	00813423          	sd	s0,8(sp)
    80005900:	01010413          	addi	s0,sp,16
    80005904:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005908:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    8000590c:	0006c603          	lbu	a2,0(a3)
    80005910:	fd06071b          	addiw	a4,a2,-48
    80005914:	0ff77713          	andi	a4,a4,255
    80005918:	00900793          	li	a5,9
    8000591c:	02e7e063          	bltu	a5,a4,8000593c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005920:	0025179b          	slliw	a5,a0,0x2
    80005924:	00a787bb          	addw	a5,a5,a0
    80005928:	0017979b          	slliw	a5,a5,0x1
    8000592c:	00168693          	addi	a3,a3,1
    80005930:	00c787bb          	addw	a5,a5,a2
    80005934:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005938:	fd5ff06f          	j	8000590c <_Z11stringToIntPKc+0x14>
    return n;
}
    8000593c:	00813403          	ld	s0,8(sp)
    80005940:	01010113          	addi	sp,sp,16
    80005944:	00008067          	ret

0000000080005948 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005948:	fc010113          	addi	sp,sp,-64
    8000594c:	02113c23          	sd	ra,56(sp)
    80005950:	02813823          	sd	s0,48(sp)
    80005954:	02913423          	sd	s1,40(sp)
    80005958:	03213023          	sd	s2,32(sp)
    8000595c:	01313c23          	sd	s3,24(sp)
    80005960:	04010413          	addi	s0,sp,64
    80005964:	00050493          	mv	s1,a0
    80005968:	00058913          	mv	s2,a1
    8000596c:	00060993          	mv	s3,a2
    LOCK();
    80005970:	00100613          	li	a2,1
    80005974:	00000593          	li	a1,0
    80005978:	00006517          	auipc	a0,0x6
    8000597c:	79050513          	addi	a0,a0,1936 # 8000c108 <lockPrint>
    80005980:	ffffc097          	auipc	ra,0xffffc
    80005984:	ae4080e7          	jalr	-1308(ra) # 80001464 <copy_and_swap>
    80005988:	00050863          	beqz	a0,80005998 <_Z8printIntiii+0x50>
    8000598c:	ffffc097          	auipc	ra,0xffffc
    80005990:	c48080e7          	jalr	-952(ra) # 800015d4 <_Z15thread_dispatchv>
    80005994:	fddff06f          	j	80005970 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005998:	00098463          	beqz	s3,800059a0 <_Z8printIntiii+0x58>
    8000599c:	0804c463          	bltz	s1,80005a24 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800059a0:	0004851b          	sext.w	a0,s1
    neg = 0;
    800059a4:	00000593          	li	a1,0
    }

    i = 0;
    800059a8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800059ac:	0009079b          	sext.w	a5,s2
    800059b0:	0325773b          	remuw	a4,a0,s2
    800059b4:	00048613          	mv	a2,s1
    800059b8:	0014849b          	addiw	s1,s1,1
    800059bc:	02071693          	slli	a3,a4,0x20
    800059c0:	0206d693          	srli	a3,a3,0x20
    800059c4:	00006717          	auipc	a4,0x6
    800059c8:	ddc70713          	addi	a4,a4,-548 # 8000b7a0 <digits>
    800059cc:	00d70733          	add	a4,a4,a3
    800059d0:	00074683          	lbu	a3,0(a4)
    800059d4:	fd040713          	addi	a4,s0,-48
    800059d8:	00c70733          	add	a4,a4,a2
    800059dc:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800059e0:	0005071b          	sext.w	a4,a0
    800059e4:	0325553b          	divuw	a0,a0,s2
    800059e8:	fcf772e3          	bgeu	a4,a5,800059ac <_Z8printIntiii+0x64>
    if(neg)
    800059ec:	00058c63          	beqz	a1,80005a04 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800059f0:	fd040793          	addi	a5,s0,-48
    800059f4:	009784b3          	add	s1,a5,s1
    800059f8:	02d00793          	li	a5,45
    800059fc:	fef48823          	sb	a5,-16(s1)
    80005a00:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005a04:	fff4849b          	addiw	s1,s1,-1
    80005a08:	0204c463          	bltz	s1,80005a30 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005a0c:	fd040793          	addi	a5,s0,-48
    80005a10:	009787b3          	add	a5,a5,s1
    80005a14:	ff07c503          	lbu	a0,-16(a5)
    80005a18:	ffffc097          	auipc	ra,0xffffc
    80005a1c:	d68080e7          	jalr	-664(ra) # 80001780 <_Z4putcc>
    80005a20:	fe5ff06f          	j	80005a04 <_Z8printIntiii+0xbc>
        x = -xx;
    80005a24:	4090053b          	negw	a0,s1
        neg = 1;
    80005a28:	00100593          	li	a1,1
        x = -xx;
    80005a2c:	f7dff06f          	j	800059a8 <_Z8printIntiii+0x60>

    UNLOCK();
    80005a30:	00000613          	li	a2,0
    80005a34:	00100593          	li	a1,1
    80005a38:	00006517          	auipc	a0,0x6
    80005a3c:	6d050513          	addi	a0,a0,1744 # 8000c108 <lockPrint>
    80005a40:	ffffc097          	auipc	ra,0xffffc
    80005a44:	a24080e7          	jalr	-1500(ra) # 80001464 <copy_and_swap>
    80005a48:	fe0514e3          	bnez	a0,80005a30 <_Z8printIntiii+0xe8>
    80005a4c:	03813083          	ld	ra,56(sp)
    80005a50:	03013403          	ld	s0,48(sp)
    80005a54:	02813483          	ld	s1,40(sp)
    80005a58:	02013903          	ld	s2,32(sp)
    80005a5c:	01813983          	ld	s3,24(sp)
    80005a60:	04010113          	addi	sp,sp,64
    80005a64:	00008067          	ret

0000000080005a68 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005a68:	fd010113          	addi	sp,sp,-48
    80005a6c:	02113423          	sd	ra,40(sp)
    80005a70:	02813023          	sd	s0,32(sp)
    80005a74:	00913c23          	sd	s1,24(sp)
    80005a78:	01213823          	sd	s2,16(sp)
    80005a7c:	01313423          	sd	s3,8(sp)
    80005a80:	03010413          	addi	s0,sp,48
    80005a84:	00050493          	mv	s1,a0
    80005a88:	00058913          	mv	s2,a1
    80005a8c:	0015879b          	addiw	a5,a1,1
    80005a90:	0007851b          	sext.w	a0,a5
    80005a94:	00f4a023          	sw	a5,0(s1)
    80005a98:	0004a823          	sw	zero,16(s1)
    80005a9c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005aa0:	00251513          	slli	a0,a0,0x2
    80005aa4:	ffffc097          	auipc	ra,0xffffc
    80005aa8:	a18080e7          	jalr	-1512(ra) # 800014bc <_Z9mem_allocm>
    80005aac:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005ab0:	01000513          	li	a0,16
    80005ab4:	ffffc097          	auipc	ra,0xffffc
    80005ab8:	3a8080e7          	jalr	936(ra) # 80001e5c <_Znwm>
    80005abc:	00050993          	mv	s3,a0
    80005ac0:	00000593          	li	a1,0
    80005ac4:	ffffc097          	auipc	ra,0xffffc
    80005ac8:	634080e7          	jalr	1588(ra) # 800020f8 <_ZN9SemaphoreC1Ej>
    80005acc:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005ad0:	01000513          	li	a0,16
    80005ad4:	ffffc097          	auipc	ra,0xffffc
    80005ad8:	388080e7          	jalr	904(ra) # 80001e5c <_Znwm>
    80005adc:	00050993          	mv	s3,a0
    80005ae0:	00090593          	mv	a1,s2
    80005ae4:	ffffc097          	auipc	ra,0xffffc
    80005ae8:	614080e7          	jalr	1556(ra) # 800020f8 <_ZN9SemaphoreC1Ej>
    80005aec:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005af0:	01000513          	li	a0,16
    80005af4:	ffffc097          	auipc	ra,0xffffc
    80005af8:	368080e7          	jalr	872(ra) # 80001e5c <_Znwm>
    80005afc:	00050913          	mv	s2,a0
    80005b00:	00100593          	li	a1,1
    80005b04:	ffffc097          	auipc	ra,0xffffc
    80005b08:	5f4080e7          	jalr	1524(ra) # 800020f8 <_ZN9SemaphoreC1Ej>
    80005b0c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005b10:	01000513          	li	a0,16
    80005b14:	ffffc097          	auipc	ra,0xffffc
    80005b18:	348080e7          	jalr	840(ra) # 80001e5c <_Znwm>
    80005b1c:	00050913          	mv	s2,a0
    80005b20:	00100593          	li	a1,1
    80005b24:	ffffc097          	auipc	ra,0xffffc
    80005b28:	5d4080e7          	jalr	1492(ra) # 800020f8 <_ZN9SemaphoreC1Ej>
    80005b2c:	0324b823          	sd	s2,48(s1)
}
    80005b30:	02813083          	ld	ra,40(sp)
    80005b34:	02013403          	ld	s0,32(sp)
    80005b38:	01813483          	ld	s1,24(sp)
    80005b3c:	01013903          	ld	s2,16(sp)
    80005b40:	00813983          	ld	s3,8(sp)
    80005b44:	03010113          	addi	sp,sp,48
    80005b48:	00008067          	ret
    80005b4c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005b50:	00098513          	mv	a0,s3
    80005b54:	ffffc097          	auipc	ra,0xffffc
    80005b58:	358080e7          	jalr	856(ra) # 80001eac <_ZdlPv>
    80005b5c:	00048513          	mv	a0,s1
    80005b60:	00007097          	auipc	ra,0x7
    80005b64:	688080e7          	jalr	1672(ra) # 8000d1e8 <_Unwind_Resume>
    80005b68:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005b6c:	00098513          	mv	a0,s3
    80005b70:	ffffc097          	auipc	ra,0xffffc
    80005b74:	33c080e7          	jalr	828(ra) # 80001eac <_ZdlPv>
    80005b78:	00048513          	mv	a0,s1
    80005b7c:	00007097          	auipc	ra,0x7
    80005b80:	66c080e7          	jalr	1644(ra) # 8000d1e8 <_Unwind_Resume>
    80005b84:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005b88:	00090513          	mv	a0,s2
    80005b8c:	ffffc097          	auipc	ra,0xffffc
    80005b90:	320080e7          	jalr	800(ra) # 80001eac <_ZdlPv>
    80005b94:	00048513          	mv	a0,s1
    80005b98:	00007097          	auipc	ra,0x7
    80005b9c:	650080e7          	jalr	1616(ra) # 8000d1e8 <_Unwind_Resume>
    80005ba0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005ba4:	00090513          	mv	a0,s2
    80005ba8:	ffffc097          	auipc	ra,0xffffc
    80005bac:	304080e7          	jalr	772(ra) # 80001eac <_ZdlPv>
    80005bb0:	00048513          	mv	a0,s1
    80005bb4:	00007097          	auipc	ra,0x7
    80005bb8:	634080e7          	jalr	1588(ra) # 8000d1e8 <_Unwind_Resume>

0000000080005bbc <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005bbc:	fe010113          	addi	sp,sp,-32
    80005bc0:	00113c23          	sd	ra,24(sp)
    80005bc4:	00813823          	sd	s0,16(sp)
    80005bc8:	00913423          	sd	s1,8(sp)
    80005bcc:	01213023          	sd	s2,0(sp)
    80005bd0:	02010413          	addi	s0,sp,32
    80005bd4:	00050493          	mv	s1,a0
    80005bd8:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005bdc:	01853503          	ld	a0,24(a0)
    80005be0:	ffffc097          	auipc	ra,0xffffc
    80005be4:	550080e7          	jalr	1360(ra) # 80002130 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005be8:	0304b503          	ld	a0,48(s1)
    80005bec:	ffffc097          	auipc	ra,0xffffc
    80005bf0:	544080e7          	jalr	1348(ra) # 80002130 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005bf4:	0084b783          	ld	a5,8(s1)
    80005bf8:	0144a703          	lw	a4,20(s1)
    80005bfc:	00271713          	slli	a4,a4,0x2
    80005c00:	00e787b3          	add	a5,a5,a4
    80005c04:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005c08:	0144a783          	lw	a5,20(s1)
    80005c0c:	0017879b          	addiw	a5,a5,1
    80005c10:	0004a703          	lw	a4,0(s1)
    80005c14:	02e7e7bb          	remw	a5,a5,a4
    80005c18:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005c1c:	0304b503          	ld	a0,48(s1)
    80005c20:	ffffc097          	auipc	ra,0xffffc
    80005c24:	53c080e7          	jalr	1340(ra) # 8000215c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005c28:	0204b503          	ld	a0,32(s1)
    80005c2c:	ffffc097          	auipc	ra,0xffffc
    80005c30:	530080e7          	jalr	1328(ra) # 8000215c <_ZN9Semaphore6signalEv>

}
    80005c34:	01813083          	ld	ra,24(sp)
    80005c38:	01013403          	ld	s0,16(sp)
    80005c3c:	00813483          	ld	s1,8(sp)
    80005c40:	00013903          	ld	s2,0(sp)
    80005c44:	02010113          	addi	sp,sp,32
    80005c48:	00008067          	ret

0000000080005c4c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005c4c:	fe010113          	addi	sp,sp,-32
    80005c50:	00113c23          	sd	ra,24(sp)
    80005c54:	00813823          	sd	s0,16(sp)
    80005c58:	00913423          	sd	s1,8(sp)
    80005c5c:	01213023          	sd	s2,0(sp)
    80005c60:	02010413          	addi	s0,sp,32
    80005c64:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005c68:	02053503          	ld	a0,32(a0)
    80005c6c:	ffffc097          	auipc	ra,0xffffc
    80005c70:	4c4080e7          	jalr	1220(ra) # 80002130 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005c74:	0284b503          	ld	a0,40(s1)
    80005c78:	ffffc097          	auipc	ra,0xffffc
    80005c7c:	4b8080e7          	jalr	1208(ra) # 80002130 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005c80:	0084b703          	ld	a4,8(s1)
    80005c84:	0104a783          	lw	a5,16(s1)
    80005c88:	00279693          	slli	a3,a5,0x2
    80005c8c:	00d70733          	add	a4,a4,a3
    80005c90:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005c94:	0017879b          	addiw	a5,a5,1
    80005c98:	0004a703          	lw	a4,0(s1)
    80005c9c:	02e7e7bb          	remw	a5,a5,a4
    80005ca0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005ca4:	0284b503          	ld	a0,40(s1)
    80005ca8:	ffffc097          	auipc	ra,0xffffc
    80005cac:	4b4080e7          	jalr	1204(ra) # 8000215c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005cb0:	0184b503          	ld	a0,24(s1)
    80005cb4:	ffffc097          	auipc	ra,0xffffc
    80005cb8:	4a8080e7          	jalr	1192(ra) # 8000215c <_ZN9Semaphore6signalEv>

    return ret;
}
    80005cbc:	00090513          	mv	a0,s2
    80005cc0:	01813083          	ld	ra,24(sp)
    80005cc4:	01013403          	ld	s0,16(sp)
    80005cc8:	00813483          	ld	s1,8(sp)
    80005ccc:	00013903          	ld	s2,0(sp)
    80005cd0:	02010113          	addi	sp,sp,32
    80005cd4:	00008067          	ret

0000000080005cd8 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005cd8:	fe010113          	addi	sp,sp,-32
    80005cdc:	00113c23          	sd	ra,24(sp)
    80005ce0:	00813823          	sd	s0,16(sp)
    80005ce4:	00913423          	sd	s1,8(sp)
    80005ce8:	01213023          	sd	s2,0(sp)
    80005cec:	02010413          	addi	s0,sp,32
    80005cf0:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005cf4:	02853503          	ld	a0,40(a0)
    80005cf8:	ffffc097          	auipc	ra,0xffffc
    80005cfc:	438080e7          	jalr	1080(ra) # 80002130 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005d00:	0304b503          	ld	a0,48(s1)
    80005d04:	ffffc097          	auipc	ra,0xffffc
    80005d08:	42c080e7          	jalr	1068(ra) # 80002130 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005d0c:	0144a783          	lw	a5,20(s1)
    80005d10:	0104a903          	lw	s2,16(s1)
    80005d14:	0327ce63          	blt	a5,s2,80005d50 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005d18:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005d1c:	0304b503          	ld	a0,48(s1)
    80005d20:	ffffc097          	auipc	ra,0xffffc
    80005d24:	43c080e7          	jalr	1084(ra) # 8000215c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005d28:	0284b503          	ld	a0,40(s1)
    80005d2c:	ffffc097          	auipc	ra,0xffffc
    80005d30:	430080e7          	jalr	1072(ra) # 8000215c <_ZN9Semaphore6signalEv>

    return ret;
}
    80005d34:	00090513          	mv	a0,s2
    80005d38:	01813083          	ld	ra,24(sp)
    80005d3c:	01013403          	ld	s0,16(sp)
    80005d40:	00813483          	ld	s1,8(sp)
    80005d44:	00013903          	ld	s2,0(sp)
    80005d48:	02010113          	addi	sp,sp,32
    80005d4c:	00008067          	ret
        ret = cap - head + tail;
    80005d50:	0004a703          	lw	a4,0(s1)
    80005d54:	4127093b          	subw	s2,a4,s2
    80005d58:	00f9093b          	addw	s2,s2,a5
    80005d5c:	fc1ff06f          	j	80005d1c <_ZN9BufferCPP6getCntEv+0x44>

0000000080005d60 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005d60:	fe010113          	addi	sp,sp,-32
    80005d64:	00113c23          	sd	ra,24(sp)
    80005d68:	00813823          	sd	s0,16(sp)
    80005d6c:	00913423          	sd	s1,8(sp)
    80005d70:	02010413          	addi	s0,sp,32
    80005d74:	00050493          	mv	s1,a0
    Console::putc('\n');
    80005d78:	00a00513          	li	a0,10
    80005d7c:	ffffc097          	auipc	ra,0xffffc
    80005d80:	434080e7          	jalr	1076(ra) # 800021b0 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80005d84:	00003517          	auipc	a0,0x3
    80005d88:	59c50513          	addi	a0,a0,1436 # 80009320 <CONSOLE_STATUS+0x310>
    80005d8c:	00000097          	auipc	ra,0x0
    80005d90:	a0c080e7          	jalr	-1524(ra) # 80005798 <_Z11printStringPKc>
    while (getCnt()) {
    80005d94:	00048513          	mv	a0,s1
    80005d98:	00000097          	auipc	ra,0x0
    80005d9c:	f40080e7          	jalr	-192(ra) # 80005cd8 <_ZN9BufferCPP6getCntEv>
    80005da0:	02050c63          	beqz	a0,80005dd8 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80005da4:	0084b783          	ld	a5,8(s1)
    80005da8:	0104a703          	lw	a4,16(s1)
    80005dac:	00271713          	slli	a4,a4,0x2
    80005db0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80005db4:	0007c503          	lbu	a0,0(a5)
    80005db8:	ffffc097          	auipc	ra,0xffffc
    80005dbc:	3f8080e7          	jalr	1016(ra) # 800021b0 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80005dc0:	0104a783          	lw	a5,16(s1)
    80005dc4:	0017879b          	addiw	a5,a5,1
    80005dc8:	0004a703          	lw	a4,0(s1)
    80005dcc:	02e7e7bb          	remw	a5,a5,a4
    80005dd0:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80005dd4:	fc1ff06f          	j	80005d94 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80005dd8:	02100513          	li	a0,33
    80005ddc:	ffffc097          	auipc	ra,0xffffc
    80005de0:	3d4080e7          	jalr	980(ra) # 800021b0 <_ZN7Console4putcEc>
    Console::putc('\n');
    80005de4:	00a00513          	li	a0,10
    80005de8:	ffffc097          	auipc	ra,0xffffc
    80005dec:	3c8080e7          	jalr	968(ra) # 800021b0 <_ZN7Console4putcEc>
    mem_free(buffer);
    80005df0:	0084b503          	ld	a0,8(s1)
    80005df4:	ffffb097          	auipc	ra,0xffffb
    80005df8:	700080e7          	jalr	1792(ra) # 800014f4 <_Z8mem_freePv>
    delete itemAvailable;
    80005dfc:	0204b503          	ld	a0,32(s1)
    80005e00:	00050863          	beqz	a0,80005e10 <_ZN9BufferCPPD1Ev+0xb0>
    80005e04:	00053783          	ld	a5,0(a0)
    80005e08:	0087b783          	ld	a5,8(a5)
    80005e0c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005e10:	0184b503          	ld	a0,24(s1)
    80005e14:	00050863          	beqz	a0,80005e24 <_ZN9BufferCPPD1Ev+0xc4>
    80005e18:	00053783          	ld	a5,0(a0)
    80005e1c:	0087b783          	ld	a5,8(a5)
    80005e20:	000780e7          	jalr	a5
    delete mutexTail;
    80005e24:	0304b503          	ld	a0,48(s1)
    80005e28:	00050863          	beqz	a0,80005e38 <_ZN9BufferCPPD1Ev+0xd8>
    80005e2c:	00053783          	ld	a5,0(a0)
    80005e30:	0087b783          	ld	a5,8(a5)
    80005e34:	000780e7          	jalr	a5
    delete mutexHead;
    80005e38:	0284b503          	ld	a0,40(s1)
    80005e3c:	00050863          	beqz	a0,80005e4c <_ZN9BufferCPPD1Ev+0xec>
    80005e40:	00053783          	ld	a5,0(a0)
    80005e44:	0087b783          	ld	a5,8(a5)
    80005e48:	000780e7          	jalr	a5
}
    80005e4c:	01813083          	ld	ra,24(sp)
    80005e50:	01013403          	ld	s0,16(sp)
    80005e54:	00813483          	ld	s1,8(sp)
    80005e58:	02010113          	addi	sp,sp,32
    80005e5c:	00008067          	ret

0000000080005e60 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80005e60:	fe010113          	addi	sp,sp,-32
    80005e64:	00113c23          	sd	ra,24(sp)
    80005e68:	00813823          	sd	s0,16(sp)
    80005e6c:	00913423          	sd	s1,8(sp)
    80005e70:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80005e74:	00003517          	auipc	a0,0x3
    80005e78:	4c450513          	addi	a0,a0,1220 # 80009338 <CONSOLE_STATUS+0x328>
    80005e7c:	00000097          	auipc	ra,0x0
    80005e80:	91c080e7          	jalr	-1764(ra) # 80005798 <_Z11printStringPKc>
    int test = getc() - '0';
    80005e84:	ffffc097          	auipc	ra,0xffffc
    80005e88:	8c8080e7          	jalr	-1848(ra) # 8000174c <_Z4getcv>
    80005e8c:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80005e90:	ffffc097          	auipc	ra,0xffffc
    80005e94:	8bc080e7          	jalr	-1860(ra) # 8000174c <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80005e98:	00700793          	li	a5,7
    80005e9c:	1097e263          	bltu	a5,s1,80005fa0 <_Z8userMainv+0x140>
    80005ea0:	00249493          	slli	s1,s1,0x2
    80005ea4:	00003717          	auipc	a4,0x3
    80005ea8:	6ec70713          	addi	a4,a4,1772 # 80009590 <CONSOLE_STATUS+0x580>
    80005eac:	00e484b3          	add	s1,s1,a4
    80005eb0:	0004a783          	lw	a5,0(s1)
    80005eb4:	00e787b3          	add	a5,a5,a4
    80005eb8:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80005ebc:	fffff097          	auipc	ra,0xfffff
    80005ec0:	f54080e7          	jalr	-172(ra) # 80004e10 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80005ec4:	00003517          	auipc	a0,0x3
    80005ec8:	49450513          	addi	a0,a0,1172 # 80009358 <CONSOLE_STATUS+0x348>
    80005ecc:	00000097          	auipc	ra,0x0
    80005ed0:	8cc080e7          	jalr	-1844(ra) # 80005798 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80005ed4:	01813083          	ld	ra,24(sp)
    80005ed8:	01013403          	ld	s0,16(sp)
    80005edc:	00813483          	ld	s1,8(sp)
    80005ee0:	02010113          	addi	sp,sp,32
    80005ee4:	00008067          	ret
            Threads_CPP_API_test();
    80005ee8:	ffffe097          	auipc	ra,0xffffe
    80005eec:	e08080e7          	jalr	-504(ra) # 80003cf0 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80005ef0:	00003517          	auipc	a0,0x3
    80005ef4:	4a850513          	addi	a0,a0,1192 # 80009398 <CONSOLE_STATUS+0x388>
    80005ef8:	00000097          	auipc	ra,0x0
    80005efc:	8a0080e7          	jalr	-1888(ra) # 80005798 <_Z11printStringPKc>
            break;
    80005f00:	fd5ff06f          	j	80005ed4 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80005f04:	ffffd097          	auipc	ra,0xffffd
    80005f08:	640080e7          	jalr	1600(ra) # 80003544 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80005f0c:	00003517          	auipc	a0,0x3
    80005f10:	4cc50513          	addi	a0,a0,1228 # 800093d8 <CONSOLE_STATUS+0x3c8>
    80005f14:	00000097          	auipc	ra,0x0
    80005f18:	884080e7          	jalr	-1916(ra) # 80005798 <_Z11printStringPKc>
            break;
    80005f1c:	fb9ff06f          	j	80005ed4 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80005f20:	fffff097          	auipc	ra,0xfffff
    80005f24:	234080e7          	jalr	564(ra) # 80005154 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80005f28:	00003517          	auipc	a0,0x3
    80005f2c:	50050513          	addi	a0,a0,1280 # 80009428 <CONSOLE_STATUS+0x418>
    80005f30:	00000097          	auipc	ra,0x0
    80005f34:	868080e7          	jalr	-1944(ra) # 80005798 <_Z11printStringPKc>
            break;
    80005f38:	f9dff06f          	j	80005ed4 <_Z8userMainv+0x74>
            testSleeping();
    80005f3c:	00000097          	auipc	ra,0x0
    80005f40:	11c080e7          	jalr	284(ra) # 80006058 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80005f44:	00003517          	auipc	a0,0x3
    80005f48:	53c50513          	addi	a0,a0,1340 # 80009480 <CONSOLE_STATUS+0x470>
    80005f4c:	00000097          	auipc	ra,0x0
    80005f50:	84c080e7          	jalr	-1972(ra) # 80005798 <_Z11printStringPKc>
            break;
    80005f54:	f81ff06f          	j	80005ed4 <_Z8userMainv+0x74>
            testConsumerProducer();
    80005f58:	ffffe097          	auipc	ra,0xffffe
    80005f5c:	258080e7          	jalr	600(ra) # 800041b0 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80005f60:	00003517          	auipc	a0,0x3
    80005f64:	55050513          	addi	a0,a0,1360 # 800094b0 <CONSOLE_STATUS+0x4a0>
    80005f68:	00000097          	auipc	ra,0x0
    80005f6c:	830080e7          	jalr	-2000(ra) # 80005798 <_Z11printStringPKc>
            break;
    80005f70:	f65ff06f          	j	80005ed4 <_Z8userMainv+0x74>
            System_Mode_test();
    80005f74:	00000097          	auipc	ra,0x0
    80005f78:	658080e7          	jalr	1624(ra) # 800065cc <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80005f7c:	00003517          	auipc	a0,0x3
    80005f80:	57450513          	addi	a0,a0,1396 # 800094f0 <CONSOLE_STATUS+0x4e0>
    80005f84:	00000097          	auipc	ra,0x0
    80005f88:	814080e7          	jalr	-2028(ra) # 80005798 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80005f8c:	00003517          	auipc	a0,0x3
    80005f90:	58450513          	addi	a0,a0,1412 # 80009510 <CONSOLE_STATUS+0x500>
    80005f94:	00000097          	auipc	ra,0x0
    80005f98:	804080e7          	jalr	-2044(ra) # 80005798 <_Z11printStringPKc>
            break;
    80005f9c:	f39ff06f          	j	80005ed4 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80005fa0:	00003517          	auipc	a0,0x3
    80005fa4:	5c850513          	addi	a0,a0,1480 # 80009568 <CONSOLE_STATUS+0x558>
    80005fa8:	fffff097          	auipc	ra,0xfffff
    80005fac:	7f0080e7          	jalr	2032(ra) # 80005798 <_Z11printStringPKc>
    80005fb0:	f25ff06f          	j	80005ed4 <_Z8userMainv+0x74>

0000000080005fb4 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80005fb4:	fe010113          	addi	sp,sp,-32
    80005fb8:	00113c23          	sd	ra,24(sp)
    80005fbc:	00813823          	sd	s0,16(sp)
    80005fc0:	00913423          	sd	s1,8(sp)
    80005fc4:	01213023          	sd	s2,0(sp)
    80005fc8:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80005fcc:	00053903          	ld	s2,0(a0)
    int i = 6;
    80005fd0:	00600493          	li	s1,6
    while (--i > 0) {
    80005fd4:	fff4849b          	addiw	s1,s1,-1
    80005fd8:	04905463          	blez	s1,80006020 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80005fdc:	00003517          	auipc	a0,0x3
    80005fe0:	5d450513          	addi	a0,a0,1492 # 800095b0 <CONSOLE_STATUS+0x5a0>
    80005fe4:	fffff097          	auipc	ra,0xfffff
    80005fe8:	7b4080e7          	jalr	1972(ra) # 80005798 <_Z11printStringPKc>
        printInt(sleep_time);
    80005fec:	00000613          	li	a2,0
    80005ff0:	00a00593          	li	a1,10
    80005ff4:	0009051b          	sext.w	a0,s2
    80005ff8:	00000097          	auipc	ra,0x0
    80005ffc:	950080e7          	jalr	-1712(ra) # 80005948 <_Z8printIntiii>
        printString(" !\n");
    80006000:	00003517          	auipc	a0,0x3
    80006004:	5b850513          	addi	a0,a0,1464 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006008:	fffff097          	auipc	ra,0xfffff
    8000600c:	790080e7          	jalr	1936(ra) # 80005798 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006010:	00090513          	mv	a0,s2
    80006014:	ffffb097          	auipc	ra,0xffffb
    80006018:	700080e7          	jalr	1792(ra) # 80001714 <_Z10time_sleepm>
    while (--i > 0) {
    8000601c:	fb9ff06f          	j	80005fd4 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006020:	00a00793          	li	a5,10
    80006024:	02f95933          	divu	s2,s2,a5
    80006028:	fff90913          	addi	s2,s2,-1
    8000602c:	00006797          	auipc	a5,0x6
    80006030:	0e478793          	addi	a5,a5,228 # 8000c110 <_ZL8finished>
    80006034:	01278933          	add	s2,a5,s2
    80006038:	00100793          	li	a5,1
    8000603c:	00f90023          	sb	a5,0(s2)
}
    80006040:	01813083          	ld	ra,24(sp)
    80006044:	01013403          	ld	s0,16(sp)
    80006048:	00813483          	ld	s1,8(sp)
    8000604c:	00013903          	ld	s2,0(sp)
    80006050:	02010113          	addi	sp,sp,32
    80006054:	00008067          	ret

0000000080006058 <_Z12testSleepingv>:

void testSleeping() {
    80006058:	fc010113          	addi	sp,sp,-64
    8000605c:	02113c23          	sd	ra,56(sp)
    80006060:	02813823          	sd	s0,48(sp)
    80006064:	02913423          	sd	s1,40(sp)
    80006068:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    8000606c:	00a00793          	li	a5,10
    80006070:	fcf43823          	sd	a5,-48(s0)
    80006074:	01400793          	li	a5,20
    80006078:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    8000607c:	00000493          	li	s1,0
    80006080:	02c0006f          	j	800060ac <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006084:	00349793          	slli	a5,s1,0x3
    80006088:	fd040613          	addi	a2,s0,-48
    8000608c:	00f60633          	add	a2,a2,a5
    80006090:	00000597          	auipc	a1,0x0
    80006094:	f2458593          	addi	a1,a1,-220 # 80005fb4 <_ZL9sleepyRunPv>
    80006098:	fc040513          	addi	a0,s0,-64
    8000609c:	00f50533          	add	a0,a0,a5
    800060a0:	ffffb097          	auipc	ra,0xffffb
    800060a4:	48c080e7          	jalr	1164(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800060a8:	0014849b          	addiw	s1,s1,1
    800060ac:	00100793          	li	a5,1
    800060b0:	fc97dae3          	bge	a5,s1,80006084 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800060b4:	00006797          	auipc	a5,0x6
    800060b8:	05c7c783          	lbu	a5,92(a5) # 8000c110 <_ZL8finished>
    800060bc:	fe078ce3          	beqz	a5,800060b4 <_Z12testSleepingv+0x5c>
    800060c0:	00006797          	auipc	a5,0x6
    800060c4:	0517c783          	lbu	a5,81(a5) # 8000c111 <_ZL8finished+0x1>
    800060c8:	fe0786e3          	beqz	a5,800060b4 <_Z12testSleepingv+0x5c>
}
    800060cc:	03813083          	ld	ra,56(sp)
    800060d0:	03013403          	ld	s0,48(sp)
    800060d4:	02813483          	ld	s1,40(sp)
    800060d8:	04010113          	addi	sp,sp,64
    800060dc:	00008067          	ret

00000000800060e0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800060e0:	fe010113          	addi	sp,sp,-32
    800060e4:	00113c23          	sd	ra,24(sp)
    800060e8:	00813823          	sd	s0,16(sp)
    800060ec:	00913423          	sd	s1,8(sp)
    800060f0:	01213023          	sd	s2,0(sp)
    800060f4:	02010413          	addi	s0,sp,32
    800060f8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800060fc:	00100793          	li	a5,1
    80006100:	02a7f863          	bgeu	a5,a0,80006130 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006104:	00a00793          	li	a5,10
    80006108:	02f577b3          	remu	a5,a0,a5
    8000610c:	02078e63          	beqz	a5,80006148 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006110:	fff48513          	addi	a0,s1,-1
    80006114:	00000097          	auipc	ra,0x0
    80006118:	fcc080e7          	jalr	-52(ra) # 800060e0 <_ZL9fibonaccim>
    8000611c:	00050913          	mv	s2,a0
    80006120:	ffe48513          	addi	a0,s1,-2
    80006124:	00000097          	auipc	ra,0x0
    80006128:	fbc080e7          	jalr	-68(ra) # 800060e0 <_ZL9fibonaccim>
    8000612c:	00a90533          	add	a0,s2,a0
}
    80006130:	01813083          	ld	ra,24(sp)
    80006134:	01013403          	ld	s0,16(sp)
    80006138:	00813483          	ld	s1,8(sp)
    8000613c:	00013903          	ld	s2,0(sp)
    80006140:	02010113          	addi	sp,sp,32
    80006144:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006148:	ffffb097          	auipc	ra,0xffffb
    8000614c:	48c080e7          	jalr	1164(ra) # 800015d4 <_Z15thread_dispatchv>
    80006150:	fc1ff06f          	j	80006110 <_ZL9fibonaccim+0x30>

0000000080006154 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006154:	fe010113          	addi	sp,sp,-32
    80006158:	00113c23          	sd	ra,24(sp)
    8000615c:	00813823          	sd	s0,16(sp)
    80006160:	00913423          	sd	s1,8(sp)
    80006164:	01213023          	sd	s2,0(sp)
    80006168:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000616c:	00a00493          	li	s1,10
    80006170:	0400006f          	j	800061b0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006174:	00003517          	auipc	a0,0x3
    80006178:	11450513          	addi	a0,a0,276 # 80009288 <CONSOLE_STATUS+0x278>
    8000617c:	fffff097          	auipc	ra,0xfffff
    80006180:	61c080e7          	jalr	1564(ra) # 80005798 <_Z11printStringPKc>
    80006184:	00000613          	li	a2,0
    80006188:	00a00593          	li	a1,10
    8000618c:	00048513          	mv	a0,s1
    80006190:	fffff097          	auipc	ra,0xfffff
    80006194:	7b8080e7          	jalr	1976(ra) # 80005948 <_Z8printIntiii>
    80006198:	00003517          	auipc	a0,0x3
    8000619c:	2e050513          	addi	a0,a0,736 # 80009478 <CONSOLE_STATUS+0x468>
    800061a0:	fffff097          	auipc	ra,0xfffff
    800061a4:	5f8080e7          	jalr	1528(ra) # 80005798 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800061a8:	0014849b          	addiw	s1,s1,1
    800061ac:	0ff4f493          	andi	s1,s1,255
    800061b0:	00c00793          	li	a5,12
    800061b4:	fc97f0e3          	bgeu	a5,s1,80006174 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800061b8:	00003517          	auipc	a0,0x3
    800061bc:	0d850513          	addi	a0,a0,216 # 80009290 <CONSOLE_STATUS+0x280>
    800061c0:	fffff097          	auipc	ra,0xfffff
    800061c4:	5d8080e7          	jalr	1496(ra) # 80005798 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800061c8:	00500313          	li	t1,5
    thread_dispatch();
    800061cc:	ffffb097          	auipc	ra,0xffffb
    800061d0:	408080e7          	jalr	1032(ra) # 800015d4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800061d4:	01000513          	li	a0,16
    800061d8:	00000097          	auipc	ra,0x0
    800061dc:	f08080e7          	jalr	-248(ra) # 800060e0 <_ZL9fibonaccim>
    800061e0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800061e4:	00003517          	auipc	a0,0x3
    800061e8:	0bc50513          	addi	a0,a0,188 # 800092a0 <CONSOLE_STATUS+0x290>
    800061ec:	fffff097          	auipc	ra,0xfffff
    800061f0:	5ac080e7          	jalr	1452(ra) # 80005798 <_Z11printStringPKc>
    800061f4:	00000613          	li	a2,0
    800061f8:	00a00593          	li	a1,10
    800061fc:	0009051b          	sext.w	a0,s2
    80006200:	fffff097          	auipc	ra,0xfffff
    80006204:	748080e7          	jalr	1864(ra) # 80005948 <_Z8printIntiii>
    80006208:	00003517          	auipc	a0,0x3
    8000620c:	27050513          	addi	a0,a0,624 # 80009478 <CONSOLE_STATUS+0x468>
    80006210:	fffff097          	auipc	ra,0xfffff
    80006214:	588080e7          	jalr	1416(ra) # 80005798 <_Z11printStringPKc>
    80006218:	0400006f          	j	80006258 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000621c:	00003517          	auipc	a0,0x3
    80006220:	06c50513          	addi	a0,a0,108 # 80009288 <CONSOLE_STATUS+0x278>
    80006224:	fffff097          	auipc	ra,0xfffff
    80006228:	574080e7          	jalr	1396(ra) # 80005798 <_Z11printStringPKc>
    8000622c:	00000613          	li	a2,0
    80006230:	00a00593          	li	a1,10
    80006234:	00048513          	mv	a0,s1
    80006238:	fffff097          	auipc	ra,0xfffff
    8000623c:	710080e7          	jalr	1808(ra) # 80005948 <_Z8printIntiii>
    80006240:	00003517          	auipc	a0,0x3
    80006244:	23850513          	addi	a0,a0,568 # 80009478 <CONSOLE_STATUS+0x468>
    80006248:	fffff097          	auipc	ra,0xfffff
    8000624c:	550080e7          	jalr	1360(ra) # 80005798 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006250:	0014849b          	addiw	s1,s1,1
    80006254:	0ff4f493          	andi	s1,s1,255
    80006258:	00f00793          	li	a5,15
    8000625c:	fc97f0e3          	bgeu	a5,s1,8000621c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006260:	00003517          	auipc	a0,0x3
    80006264:	05050513          	addi	a0,a0,80 # 800092b0 <CONSOLE_STATUS+0x2a0>
    80006268:	fffff097          	auipc	ra,0xfffff
    8000626c:	530080e7          	jalr	1328(ra) # 80005798 <_Z11printStringPKc>
    finishedD = true;
    80006270:	00100793          	li	a5,1
    80006274:	00006717          	auipc	a4,0x6
    80006278:	e8f70f23          	sb	a5,-354(a4) # 8000c112 <_ZL9finishedD>
    thread_dispatch();
    8000627c:	ffffb097          	auipc	ra,0xffffb
    80006280:	358080e7          	jalr	856(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80006284:	01813083          	ld	ra,24(sp)
    80006288:	01013403          	ld	s0,16(sp)
    8000628c:	00813483          	ld	s1,8(sp)
    80006290:	00013903          	ld	s2,0(sp)
    80006294:	02010113          	addi	sp,sp,32
    80006298:	00008067          	ret

000000008000629c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    8000629c:	fe010113          	addi	sp,sp,-32
    800062a0:	00113c23          	sd	ra,24(sp)
    800062a4:	00813823          	sd	s0,16(sp)
    800062a8:	00913423          	sd	s1,8(sp)
    800062ac:	01213023          	sd	s2,0(sp)
    800062b0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800062b4:	00000493          	li	s1,0
    800062b8:	0400006f          	j	800062f8 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800062bc:	00003517          	auipc	a0,0x3
    800062c0:	f8c50513          	addi	a0,a0,-116 # 80009248 <CONSOLE_STATUS+0x238>
    800062c4:	fffff097          	auipc	ra,0xfffff
    800062c8:	4d4080e7          	jalr	1236(ra) # 80005798 <_Z11printStringPKc>
    800062cc:	00000613          	li	a2,0
    800062d0:	00a00593          	li	a1,10
    800062d4:	00048513          	mv	a0,s1
    800062d8:	fffff097          	auipc	ra,0xfffff
    800062dc:	670080e7          	jalr	1648(ra) # 80005948 <_Z8printIntiii>
    800062e0:	00003517          	auipc	a0,0x3
    800062e4:	19850513          	addi	a0,a0,408 # 80009478 <CONSOLE_STATUS+0x468>
    800062e8:	fffff097          	auipc	ra,0xfffff
    800062ec:	4b0080e7          	jalr	1200(ra) # 80005798 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800062f0:	0014849b          	addiw	s1,s1,1
    800062f4:	0ff4f493          	andi	s1,s1,255
    800062f8:	00200793          	li	a5,2
    800062fc:	fc97f0e3          	bgeu	a5,s1,800062bc <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006300:	00003517          	auipc	a0,0x3
    80006304:	f5050513          	addi	a0,a0,-176 # 80009250 <CONSOLE_STATUS+0x240>
    80006308:	fffff097          	auipc	ra,0xfffff
    8000630c:	490080e7          	jalr	1168(ra) # 80005798 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006310:	00700313          	li	t1,7
    thread_dispatch();
    80006314:	ffffb097          	auipc	ra,0xffffb
    80006318:	2c0080e7          	jalr	704(ra) # 800015d4 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000631c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006320:	00003517          	auipc	a0,0x3
    80006324:	f4050513          	addi	a0,a0,-192 # 80009260 <CONSOLE_STATUS+0x250>
    80006328:	fffff097          	auipc	ra,0xfffff
    8000632c:	470080e7          	jalr	1136(ra) # 80005798 <_Z11printStringPKc>
    80006330:	00000613          	li	a2,0
    80006334:	00a00593          	li	a1,10
    80006338:	0009051b          	sext.w	a0,s2
    8000633c:	fffff097          	auipc	ra,0xfffff
    80006340:	60c080e7          	jalr	1548(ra) # 80005948 <_Z8printIntiii>
    80006344:	00003517          	auipc	a0,0x3
    80006348:	13450513          	addi	a0,a0,308 # 80009478 <CONSOLE_STATUS+0x468>
    8000634c:	fffff097          	auipc	ra,0xfffff
    80006350:	44c080e7          	jalr	1100(ra) # 80005798 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006354:	00c00513          	li	a0,12
    80006358:	00000097          	auipc	ra,0x0
    8000635c:	d88080e7          	jalr	-632(ra) # 800060e0 <_ZL9fibonaccim>
    80006360:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006364:	00003517          	auipc	a0,0x3
    80006368:	f0450513          	addi	a0,a0,-252 # 80009268 <CONSOLE_STATUS+0x258>
    8000636c:	fffff097          	auipc	ra,0xfffff
    80006370:	42c080e7          	jalr	1068(ra) # 80005798 <_Z11printStringPKc>
    80006374:	00000613          	li	a2,0
    80006378:	00a00593          	li	a1,10
    8000637c:	0009051b          	sext.w	a0,s2
    80006380:	fffff097          	auipc	ra,0xfffff
    80006384:	5c8080e7          	jalr	1480(ra) # 80005948 <_Z8printIntiii>
    80006388:	00003517          	auipc	a0,0x3
    8000638c:	0f050513          	addi	a0,a0,240 # 80009478 <CONSOLE_STATUS+0x468>
    80006390:	fffff097          	auipc	ra,0xfffff
    80006394:	408080e7          	jalr	1032(ra) # 80005798 <_Z11printStringPKc>
    80006398:	0400006f          	j	800063d8 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    8000639c:	00003517          	auipc	a0,0x3
    800063a0:	eac50513          	addi	a0,a0,-340 # 80009248 <CONSOLE_STATUS+0x238>
    800063a4:	fffff097          	auipc	ra,0xfffff
    800063a8:	3f4080e7          	jalr	1012(ra) # 80005798 <_Z11printStringPKc>
    800063ac:	00000613          	li	a2,0
    800063b0:	00a00593          	li	a1,10
    800063b4:	00048513          	mv	a0,s1
    800063b8:	fffff097          	auipc	ra,0xfffff
    800063bc:	590080e7          	jalr	1424(ra) # 80005948 <_Z8printIntiii>
    800063c0:	00003517          	auipc	a0,0x3
    800063c4:	0b850513          	addi	a0,a0,184 # 80009478 <CONSOLE_STATUS+0x468>
    800063c8:	fffff097          	auipc	ra,0xfffff
    800063cc:	3d0080e7          	jalr	976(ra) # 80005798 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800063d0:	0014849b          	addiw	s1,s1,1
    800063d4:	0ff4f493          	andi	s1,s1,255
    800063d8:	00500793          	li	a5,5
    800063dc:	fc97f0e3          	bgeu	a5,s1,8000639c <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    800063e0:	00003517          	auipc	a0,0x3
    800063e4:	e9850513          	addi	a0,a0,-360 # 80009278 <CONSOLE_STATUS+0x268>
    800063e8:	fffff097          	auipc	ra,0xfffff
    800063ec:	3b0080e7          	jalr	944(ra) # 80005798 <_Z11printStringPKc>
    finishedC = true;
    800063f0:	00100793          	li	a5,1
    800063f4:	00006717          	auipc	a4,0x6
    800063f8:	d0f70fa3          	sb	a5,-737(a4) # 8000c113 <_ZL9finishedC>
    thread_dispatch();
    800063fc:	ffffb097          	auipc	ra,0xffffb
    80006400:	1d8080e7          	jalr	472(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80006404:	01813083          	ld	ra,24(sp)
    80006408:	01013403          	ld	s0,16(sp)
    8000640c:	00813483          	ld	s1,8(sp)
    80006410:	00013903          	ld	s2,0(sp)
    80006414:	02010113          	addi	sp,sp,32
    80006418:	00008067          	ret

000000008000641c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000641c:	fe010113          	addi	sp,sp,-32
    80006420:	00113c23          	sd	ra,24(sp)
    80006424:	00813823          	sd	s0,16(sp)
    80006428:	00913423          	sd	s1,8(sp)
    8000642c:	01213023          	sd	s2,0(sp)
    80006430:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006434:	00000913          	li	s2,0
    80006438:	0400006f          	j	80006478 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    8000643c:	ffffb097          	auipc	ra,0xffffb
    80006440:	198080e7          	jalr	408(ra) # 800015d4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006444:	00148493          	addi	s1,s1,1
    80006448:	000027b7          	lui	a5,0x2
    8000644c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006450:	0097ee63          	bltu	a5,s1,8000646c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006454:	00000713          	li	a4,0
    80006458:	000077b7          	lui	a5,0x7
    8000645c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006460:	fce7eee3          	bltu	a5,a4,8000643c <_ZL11workerBodyBPv+0x20>
    80006464:	00170713          	addi	a4,a4,1
    80006468:	ff1ff06f          	j	80006458 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    8000646c:	00a00793          	li	a5,10
    80006470:	04f90663          	beq	s2,a5,800064bc <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006474:	00190913          	addi	s2,s2,1
    80006478:	00f00793          	li	a5,15
    8000647c:	0527e463          	bltu	a5,s2,800064c4 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006480:	00003517          	auipc	a0,0x3
    80006484:	db050513          	addi	a0,a0,-592 # 80009230 <CONSOLE_STATUS+0x220>
    80006488:	fffff097          	auipc	ra,0xfffff
    8000648c:	310080e7          	jalr	784(ra) # 80005798 <_Z11printStringPKc>
    80006490:	00000613          	li	a2,0
    80006494:	00a00593          	li	a1,10
    80006498:	0009051b          	sext.w	a0,s2
    8000649c:	fffff097          	auipc	ra,0xfffff
    800064a0:	4ac080e7          	jalr	1196(ra) # 80005948 <_Z8printIntiii>
    800064a4:	00003517          	auipc	a0,0x3
    800064a8:	fd450513          	addi	a0,a0,-44 # 80009478 <CONSOLE_STATUS+0x468>
    800064ac:	fffff097          	auipc	ra,0xfffff
    800064b0:	2ec080e7          	jalr	748(ra) # 80005798 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800064b4:	00000493          	li	s1,0
    800064b8:	f91ff06f          	j	80006448 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800064bc:	14102ff3          	csrr	t6,sepc
    800064c0:	fb5ff06f          	j	80006474 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800064c4:	00003517          	auipc	a0,0x3
    800064c8:	d7450513          	addi	a0,a0,-652 # 80009238 <CONSOLE_STATUS+0x228>
    800064cc:	fffff097          	auipc	ra,0xfffff
    800064d0:	2cc080e7          	jalr	716(ra) # 80005798 <_Z11printStringPKc>
    finishedB = true;
    800064d4:	00100793          	li	a5,1
    800064d8:	00006717          	auipc	a4,0x6
    800064dc:	c2f70e23          	sb	a5,-964(a4) # 8000c114 <_ZL9finishedB>
    thread_dispatch();
    800064e0:	ffffb097          	auipc	ra,0xffffb
    800064e4:	0f4080e7          	jalr	244(ra) # 800015d4 <_Z15thread_dispatchv>
}
    800064e8:	01813083          	ld	ra,24(sp)
    800064ec:	01013403          	ld	s0,16(sp)
    800064f0:	00813483          	ld	s1,8(sp)
    800064f4:	00013903          	ld	s2,0(sp)
    800064f8:	02010113          	addi	sp,sp,32
    800064fc:	00008067          	ret

0000000080006500 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006500:	fe010113          	addi	sp,sp,-32
    80006504:	00113c23          	sd	ra,24(sp)
    80006508:	00813823          	sd	s0,16(sp)
    8000650c:	00913423          	sd	s1,8(sp)
    80006510:	01213023          	sd	s2,0(sp)
    80006514:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006518:	00000913          	li	s2,0
    8000651c:	0380006f          	j	80006554 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006520:	ffffb097          	auipc	ra,0xffffb
    80006524:	0b4080e7          	jalr	180(ra) # 800015d4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006528:	00148493          	addi	s1,s1,1
    8000652c:	000027b7          	lui	a5,0x2
    80006530:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006534:	0097ee63          	bltu	a5,s1,80006550 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006538:	00000713          	li	a4,0
    8000653c:	000077b7          	lui	a5,0x7
    80006540:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006544:	fce7eee3          	bltu	a5,a4,80006520 <_ZL11workerBodyAPv+0x20>
    80006548:	00170713          	addi	a4,a4,1
    8000654c:	ff1ff06f          	j	8000653c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006550:	00190913          	addi	s2,s2,1
    80006554:	00900793          	li	a5,9
    80006558:	0527e063          	bltu	a5,s2,80006598 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000655c:	00003517          	auipc	a0,0x3
    80006560:	cbc50513          	addi	a0,a0,-836 # 80009218 <CONSOLE_STATUS+0x208>
    80006564:	fffff097          	auipc	ra,0xfffff
    80006568:	234080e7          	jalr	564(ra) # 80005798 <_Z11printStringPKc>
    8000656c:	00000613          	li	a2,0
    80006570:	00a00593          	li	a1,10
    80006574:	0009051b          	sext.w	a0,s2
    80006578:	fffff097          	auipc	ra,0xfffff
    8000657c:	3d0080e7          	jalr	976(ra) # 80005948 <_Z8printIntiii>
    80006580:	00003517          	auipc	a0,0x3
    80006584:	ef850513          	addi	a0,a0,-264 # 80009478 <CONSOLE_STATUS+0x468>
    80006588:	fffff097          	auipc	ra,0xfffff
    8000658c:	210080e7          	jalr	528(ra) # 80005798 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006590:	00000493          	li	s1,0
    80006594:	f99ff06f          	j	8000652c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006598:	00003517          	auipc	a0,0x3
    8000659c:	c8850513          	addi	a0,a0,-888 # 80009220 <CONSOLE_STATUS+0x210>
    800065a0:	fffff097          	auipc	ra,0xfffff
    800065a4:	1f8080e7          	jalr	504(ra) # 80005798 <_Z11printStringPKc>
    finishedA = true;
    800065a8:	00100793          	li	a5,1
    800065ac:	00006717          	auipc	a4,0x6
    800065b0:	b6f704a3          	sb	a5,-1175(a4) # 8000c115 <_ZL9finishedA>
}
    800065b4:	01813083          	ld	ra,24(sp)
    800065b8:	01013403          	ld	s0,16(sp)
    800065bc:	00813483          	ld	s1,8(sp)
    800065c0:	00013903          	ld	s2,0(sp)
    800065c4:	02010113          	addi	sp,sp,32
    800065c8:	00008067          	ret

00000000800065cc <_Z16System_Mode_testv>:


void System_Mode_test() {
    800065cc:	fd010113          	addi	sp,sp,-48
    800065d0:	02113423          	sd	ra,40(sp)
    800065d4:	02813023          	sd	s0,32(sp)
    800065d8:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800065dc:	00000613          	li	a2,0
    800065e0:	00000597          	auipc	a1,0x0
    800065e4:	f2058593          	addi	a1,a1,-224 # 80006500 <_ZL11workerBodyAPv>
    800065e8:	fd040513          	addi	a0,s0,-48
    800065ec:	ffffb097          	auipc	ra,0xffffb
    800065f0:	f40080e7          	jalr	-192(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800065f4:	00003517          	auipc	a0,0x3
    800065f8:	ccc50513          	addi	a0,a0,-820 # 800092c0 <CONSOLE_STATUS+0x2b0>
    800065fc:	fffff097          	auipc	ra,0xfffff
    80006600:	19c080e7          	jalr	412(ra) # 80005798 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006604:	00000613          	li	a2,0
    80006608:	00000597          	auipc	a1,0x0
    8000660c:	e1458593          	addi	a1,a1,-492 # 8000641c <_ZL11workerBodyBPv>
    80006610:	fd840513          	addi	a0,s0,-40
    80006614:	ffffb097          	auipc	ra,0xffffb
    80006618:	f18080e7          	jalr	-232(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000661c:	00003517          	auipc	a0,0x3
    80006620:	cbc50513          	addi	a0,a0,-836 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80006624:	fffff097          	auipc	ra,0xfffff
    80006628:	174080e7          	jalr	372(ra) # 80005798 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000662c:	00000613          	li	a2,0
    80006630:	00000597          	auipc	a1,0x0
    80006634:	c6c58593          	addi	a1,a1,-916 # 8000629c <_ZL11workerBodyCPv>
    80006638:	fe040513          	addi	a0,s0,-32
    8000663c:	ffffb097          	auipc	ra,0xffffb
    80006640:	ef0080e7          	jalr	-272(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006644:	00003517          	auipc	a0,0x3
    80006648:	cac50513          	addi	a0,a0,-852 # 800092f0 <CONSOLE_STATUS+0x2e0>
    8000664c:	fffff097          	auipc	ra,0xfffff
    80006650:	14c080e7          	jalr	332(ra) # 80005798 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006654:	00000613          	li	a2,0
    80006658:	00000597          	auipc	a1,0x0
    8000665c:	afc58593          	addi	a1,a1,-1284 # 80006154 <_ZL11workerBodyDPv>
    80006660:	fe840513          	addi	a0,s0,-24
    80006664:	ffffb097          	auipc	ra,0xffffb
    80006668:	ec8080e7          	jalr	-312(ra) # 8000152c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    8000666c:	00003517          	auipc	a0,0x3
    80006670:	c9c50513          	addi	a0,a0,-868 # 80009308 <CONSOLE_STATUS+0x2f8>
    80006674:	fffff097          	auipc	ra,0xfffff
    80006678:	124080e7          	jalr	292(ra) # 80005798 <_Z11printStringPKc>
    8000667c:	00c0006f          	j	80006688 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006680:	ffffb097          	auipc	ra,0xffffb
    80006684:	f54080e7          	jalr	-172(ra) # 800015d4 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006688:	00006797          	auipc	a5,0x6
    8000668c:	a8d7c783          	lbu	a5,-1395(a5) # 8000c115 <_ZL9finishedA>
    80006690:	fe0788e3          	beqz	a5,80006680 <_Z16System_Mode_testv+0xb4>
    80006694:	00006797          	auipc	a5,0x6
    80006698:	a807c783          	lbu	a5,-1408(a5) # 8000c114 <_ZL9finishedB>
    8000669c:	fe0782e3          	beqz	a5,80006680 <_Z16System_Mode_testv+0xb4>
    800066a0:	00006797          	auipc	a5,0x6
    800066a4:	a737c783          	lbu	a5,-1421(a5) # 8000c113 <_ZL9finishedC>
    800066a8:	fc078ce3          	beqz	a5,80006680 <_Z16System_Mode_testv+0xb4>
    800066ac:	00006797          	auipc	a5,0x6
    800066b0:	a667c783          	lbu	a5,-1434(a5) # 8000c112 <_ZL9finishedD>
    800066b4:	fc0786e3          	beqz	a5,80006680 <_Z16System_Mode_testv+0xb4>
    }

}
    800066b8:	02813083          	ld	ra,40(sp)
    800066bc:	02013403          	ld	s0,32(sp)
    800066c0:	03010113          	addi	sp,sp,48
    800066c4:	00008067          	ret

00000000800066c8 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800066c8:	fe010113          	addi	sp,sp,-32
    800066cc:	00113c23          	sd	ra,24(sp)
    800066d0:	00813823          	sd	s0,16(sp)
    800066d4:	00913423          	sd	s1,8(sp)
    800066d8:	01213023          	sd	s2,0(sp)
    800066dc:	02010413          	addi	s0,sp,32
    800066e0:	00050493          	mv	s1,a0
    800066e4:	00058913          	mv	s2,a1
    800066e8:	0015879b          	addiw	a5,a1,1
    800066ec:	0007851b          	sext.w	a0,a5
    800066f0:	00f4a023          	sw	a5,0(s1)
    800066f4:	0004a823          	sw	zero,16(s1)
    800066f8:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800066fc:	00251513          	slli	a0,a0,0x2
    80006700:	ffffb097          	auipc	ra,0xffffb
    80006704:	dbc080e7          	jalr	-580(ra) # 800014bc <_Z9mem_allocm>
    80006708:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    8000670c:	00000593          	li	a1,0
    80006710:	02048513          	addi	a0,s1,32
    80006714:	ffffb097          	auipc	ra,0xffffb
    80006718:	f1c080e7          	jalr	-228(ra) # 80001630 <_Z8sem_openPP3Semj>
    sem_open(&spaceAvailable, _cap);
    8000671c:	00090593          	mv	a1,s2
    80006720:	01848513          	addi	a0,s1,24
    80006724:	ffffb097          	auipc	ra,0xffffb
    80006728:	f0c080e7          	jalr	-244(ra) # 80001630 <_Z8sem_openPP3Semj>
    sem_open(&mutexHead, 1);
    8000672c:	00100593          	li	a1,1
    80006730:	02848513          	addi	a0,s1,40
    80006734:	ffffb097          	auipc	ra,0xffffb
    80006738:	efc080e7          	jalr	-260(ra) # 80001630 <_Z8sem_openPP3Semj>
    sem_open(&mutexTail, 1);
    8000673c:	00100593          	li	a1,1
    80006740:	03048513          	addi	a0,s1,48
    80006744:	ffffb097          	auipc	ra,0xffffb
    80006748:	eec080e7          	jalr	-276(ra) # 80001630 <_Z8sem_openPP3Semj>
}
    8000674c:	01813083          	ld	ra,24(sp)
    80006750:	01013403          	ld	s0,16(sp)
    80006754:	00813483          	ld	s1,8(sp)
    80006758:	00013903          	ld	s2,0(sp)
    8000675c:	02010113          	addi	sp,sp,32
    80006760:	00008067          	ret

0000000080006764 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006764:	fe010113          	addi	sp,sp,-32
    80006768:	00113c23          	sd	ra,24(sp)
    8000676c:	00813823          	sd	s0,16(sp)
    80006770:	00913423          	sd	s1,8(sp)
    80006774:	01213023          	sd	s2,0(sp)
    80006778:	02010413          	addi	s0,sp,32
    8000677c:	00050493          	mv	s1,a0
    80006780:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006784:	01853503          	ld	a0,24(a0)
    80006788:	ffffb097          	auipc	ra,0xffffb
    8000678c:	f1c080e7          	jalr	-228(ra) # 800016a4 <_Z8sem_waitP3Sem>

    sem_wait(mutexTail);
    80006790:	0304b503          	ld	a0,48(s1)
    80006794:	ffffb097          	auipc	ra,0xffffb
    80006798:	f10080e7          	jalr	-240(ra) # 800016a4 <_Z8sem_waitP3Sem>
    buffer[tail] = val;
    8000679c:	0084b783          	ld	a5,8(s1)
    800067a0:	0144a703          	lw	a4,20(s1)
    800067a4:	00271713          	slli	a4,a4,0x2
    800067a8:	00e787b3          	add	a5,a5,a4
    800067ac:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800067b0:	0144a783          	lw	a5,20(s1)
    800067b4:	0017879b          	addiw	a5,a5,1
    800067b8:	0004a703          	lw	a4,0(s1)
    800067bc:	02e7e7bb          	remw	a5,a5,a4
    800067c0:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800067c4:	0304b503          	ld	a0,48(s1)
    800067c8:	ffffb097          	auipc	ra,0xffffb
    800067cc:	f14080e7          	jalr	-236(ra) # 800016dc <_Z10sem_signalP3Sem>

    sem_signal(itemAvailable);
    800067d0:	0204b503          	ld	a0,32(s1)
    800067d4:	ffffb097          	auipc	ra,0xffffb
    800067d8:	f08080e7          	jalr	-248(ra) # 800016dc <_Z10sem_signalP3Sem>

}
    800067dc:	01813083          	ld	ra,24(sp)
    800067e0:	01013403          	ld	s0,16(sp)
    800067e4:	00813483          	ld	s1,8(sp)
    800067e8:	00013903          	ld	s2,0(sp)
    800067ec:	02010113          	addi	sp,sp,32
    800067f0:	00008067          	ret

00000000800067f4 <_ZN6Buffer3getEv>:

int Buffer::get() {
    800067f4:	fe010113          	addi	sp,sp,-32
    800067f8:	00113c23          	sd	ra,24(sp)
    800067fc:	00813823          	sd	s0,16(sp)
    80006800:	00913423          	sd	s1,8(sp)
    80006804:	01213023          	sd	s2,0(sp)
    80006808:	02010413          	addi	s0,sp,32
    8000680c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006810:	02053503          	ld	a0,32(a0)
    80006814:	ffffb097          	auipc	ra,0xffffb
    80006818:	e90080e7          	jalr	-368(ra) # 800016a4 <_Z8sem_waitP3Sem>

    sem_wait(mutexHead);
    8000681c:	0284b503          	ld	a0,40(s1)
    80006820:	ffffb097          	auipc	ra,0xffffb
    80006824:	e84080e7          	jalr	-380(ra) # 800016a4 <_Z8sem_waitP3Sem>

    int ret = buffer[head];
    80006828:	0084b703          	ld	a4,8(s1)
    8000682c:	0104a783          	lw	a5,16(s1)
    80006830:	00279693          	slli	a3,a5,0x2
    80006834:	00d70733          	add	a4,a4,a3
    80006838:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000683c:	0017879b          	addiw	a5,a5,1
    80006840:	0004a703          	lw	a4,0(s1)
    80006844:	02e7e7bb          	remw	a5,a5,a4
    80006848:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    8000684c:	0284b503          	ld	a0,40(s1)
    80006850:	ffffb097          	auipc	ra,0xffffb
    80006854:	e8c080e7          	jalr	-372(ra) # 800016dc <_Z10sem_signalP3Sem>

    sem_signal(spaceAvailable);
    80006858:	0184b503          	ld	a0,24(s1)
    8000685c:	ffffb097          	auipc	ra,0xffffb
    80006860:	e80080e7          	jalr	-384(ra) # 800016dc <_Z10sem_signalP3Sem>

    return ret;
}
    80006864:	00090513          	mv	a0,s2
    80006868:	01813083          	ld	ra,24(sp)
    8000686c:	01013403          	ld	s0,16(sp)
    80006870:	00813483          	ld	s1,8(sp)
    80006874:	00013903          	ld	s2,0(sp)
    80006878:	02010113          	addi	sp,sp,32
    8000687c:	00008067          	ret

0000000080006880 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006880:	fe010113          	addi	sp,sp,-32
    80006884:	00113c23          	sd	ra,24(sp)
    80006888:	00813823          	sd	s0,16(sp)
    8000688c:	00913423          	sd	s1,8(sp)
    80006890:	01213023          	sd	s2,0(sp)
    80006894:	02010413          	addi	s0,sp,32
    80006898:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    8000689c:	02853503          	ld	a0,40(a0)
    800068a0:	ffffb097          	auipc	ra,0xffffb
    800068a4:	e04080e7          	jalr	-508(ra) # 800016a4 <_Z8sem_waitP3Sem>
    sem_wait(mutexTail);
    800068a8:	0304b503          	ld	a0,48(s1)
    800068ac:	ffffb097          	auipc	ra,0xffffb
    800068b0:	df8080e7          	jalr	-520(ra) # 800016a4 <_Z8sem_waitP3Sem>

    if (tail >= head) {
    800068b4:	0144a783          	lw	a5,20(s1)
    800068b8:	0104a903          	lw	s2,16(s1)
    800068bc:	0327ce63          	blt	a5,s2,800068f8 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800068c0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800068c4:	0304b503          	ld	a0,48(s1)
    800068c8:	ffffb097          	auipc	ra,0xffffb
    800068cc:	e14080e7          	jalr	-492(ra) # 800016dc <_Z10sem_signalP3Sem>
    sem_signal(mutexHead);
    800068d0:	0284b503          	ld	a0,40(s1)
    800068d4:	ffffb097          	auipc	ra,0xffffb
    800068d8:	e08080e7          	jalr	-504(ra) # 800016dc <_Z10sem_signalP3Sem>

    return ret;
}
    800068dc:	00090513          	mv	a0,s2
    800068e0:	01813083          	ld	ra,24(sp)
    800068e4:	01013403          	ld	s0,16(sp)
    800068e8:	00813483          	ld	s1,8(sp)
    800068ec:	00013903          	ld	s2,0(sp)
    800068f0:	02010113          	addi	sp,sp,32
    800068f4:	00008067          	ret
        ret = cap - head + tail;
    800068f8:	0004a703          	lw	a4,0(s1)
    800068fc:	4127093b          	subw	s2,a4,s2
    80006900:	00f9093b          	addw	s2,s2,a5
    80006904:	fc1ff06f          	j	800068c4 <_ZN6Buffer6getCntEv+0x44>

0000000080006908 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006908:	fe010113          	addi	sp,sp,-32
    8000690c:	00113c23          	sd	ra,24(sp)
    80006910:	00813823          	sd	s0,16(sp)
    80006914:	00913423          	sd	s1,8(sp)
    80006918:	02010413          	addi	s0,sp,32
    8000691c:	00050493          	mv	s1,a0
    putc('\n');
    80006920:	00a00513          	li	a0,10
    80006924:	ffffb097          	auipc	ra,0xffffb
    80006928:	e5c080e7          	jalr	-420(ra) # 80001780 <_Z4putcc>
    printString("Buffer deleted!\n");
    8000692c:	00003517          	auipc	a0,0x3
    80006930:	9f450513          	addi	a0,a0,-1548 # 80009320 <CONSOLE_STATUS+0x310>
    80006934:	fffff097          	auipc	ra,0xfffff
    80006938:	e64080e7          	jalr	-412(ra) # 80005798 <_Z11printStringPKc>
    while (getCnt() > 0) {
    8000693c:	00048513          	mv	a0,s1
    80006940:	00000097          	auipc	ra,0x0
    80006944:	f40080e7          	jalr	-192(ra) # 80006880 <_ZN6Buffer6getCntEv>
    80006948:	02a05c63          	blez	a0,80006980 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    8000694c:	0084b783          	ld	a5,8(s1)
    80006950:	0104a703          	lw	a4,16(s1)
    80006954:	00271713          	slli	a4,a4,0x2
    80006958:	00e787b3          	add	a5,a5,a4
        putc(ch);
    8000695c:	0007c503          	lbu	a0,0(a5)
    80006960:	ffffb097          	auipc	ra,0xffffb
    80006964:	e20080e7          	jalr	-480(ra) # 80001780 <_Z4putcc>
        head = (head + 1) % cap;
    80006968:	0104a783          	lw	a5,16(s1)
    8000696c:	0017879b          	addiw	a5,a5,1
    80006970:	0004a703          	lw	a4,0(s1)
    80006974:	02e7e7bb          	remw	a5,a5,a4
    80006978:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    8000697c:	fc1ff06f          	j	8000693c <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006980:	02100513          	li	a0,33
    80006984:	ffffb097          	auipc	ra,0xffffb
    80006988:	dfc080e7          	jalr	-516(ra) # 80001780 <_Z4putcc>
    putc('\n');
    8000698c:	00a00513          	li	a0,10
    80006990:	ffffb097          	auipc	ra,0xffffb
    80006994:	df0080e7          	jalr	-528(ra) # 80001780 <_Z4putcc>
    mem_free(buffer);
    80006998:	0084b503          	ld	a0,8(s1)
    8000699c:	ffffb097          	auipc	ra,0xffffb
    800069a0:	b58080e7          	jalr	-1192(ra) # 800014f4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800069a4:	0204b503          	ld	a0,32(s1)
    800069a8:	ffffb097          	auipc	ra,0xffffb
    800069ac:	cc4080e7          	jalr	-828(ra) # 8000166c <_Z9sem_closeP3Sem>
    sem_close(spaceAvailable);
    800069b0:	0184b503          	ld	a0,24(s1)
    800069b4:	ffffb097          	auipc	ra,0xffffb
    800069b8:	cb8080e7          	jalr	-840(ra) # 8000166c <_Z9sem_closeP3Sem>
    sem_close(mutexTail);
    800069bc:	0304b503          	ld	a0,48(s1)
    800069c0:	ffffb097          	auipc	ra,0xffffb
    800069c4:	cac080e7          	jalr	-852(ra) # 8000166c <_Z9sem_closeP3Sem>
    sem_close(mutexHead);
    800069c8:	0284b503          	ld	a0,40(s1)
    800069cc:	ffffb097          	auipc	ra,0xffffb
    800069d0:	ca0080e7          	jalr	-864(ra) # 8000166c <_Z9sem_closeP3Sem>
}
    800069d4:	01813083          	ld	ra,24(sp)
    800069d8:	01013403          	ld	s0,16(sp)
    800069dc:	00813483          	ld	s1,8(sp)
    800069e0:	02010113          	addi	sp,sp,32
    800069e4:	00008067          	ret

00000000800069e8 <start>:
    800069e8:	ff010113          	addi	sp,sp,-16
    800069ec:	00813423          	sd	s0,8(sp)
    800069f0:	01010413          	addi	s0,sp,16
    800069f4:	300027f3          	csrr	a5,mstatus
    800069f8:	ffffe737          	lui	a4,0xffffe
    800069fc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff147f>
    80006a00:	00e7f7b3          	and	a5,a5,a4
    80006a04:	00001737          	lui	a4,0x1
    80006a08:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006a0c:	00e7e7b3          	or	a5,a5,a4
    80006a10:	30079073          	csrw	mstatus,a5
    80006a14:	00000797          	auipc	a5,0x0
    80006a18:	16078793          	addi	a5,a5,352 # 80006b74 <system_main>
    80006a1c:	34179073          	csrw	mepc,a5
    80006a20:	00000793          	li	a5,0
    80006a24:	18079073          	csrw	satp,a5
    80006a28:	000107b7          	lui	a5,0x10
    80006a2c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006a30:	30279073          	csrw	medeleg,a5
    80006a34:	30379073          	csrw	mideleg,a5
    80006a38:	104027f3          	csrr	a5,sie
    80006a3c:	2227e793          	ori	a5,a5,546
    80006a40:	10479073          	csrw	sie,a5
    80006a44:	fff00793          	li	a5,-1
    80006a48:	00a7d793          	srli	a5,a5,0xa
    80006a4c:	3b079073          	csrw	pmpaddr0,a5
    80006a50:	00f00793          	li	a5,15
    80006a54:	3a079073          	csrw	pmpcfg0,a5
    80006a58:	f14027f3          	csrr	a5,mhartid
    80006a5c:	0200c737          	lui	a4,0x200c
    80006a60:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006a64:	0007869b          	sext.w	a3,a5
    80006a68:	00269713          	slli	a4,a3,0x2
    80006a6c:	000f4637          	lui	a2,0xf4
    80006a70:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006a74:	00d70733          	add	a4,a4,a3
    80006a78:	0037979b          	slliw	a5,a5,0x3
    80006a7c:	020046b7          	lui	a3,0x2004
    80006a80:	00d787b3          	add	a5,a5,a3
    80006a84:	00c585b3          	add	a1,a1,a2
    80006a88:	00371693          	slli	a3,a4,0x3
    80006a8c:	00005717          	auipc	a4,0x5
    80006a90:	69470713          	addi	a4,a4,1684 # 8000c120 <timer_scratch>
    80006a94:	00b7b023          	sd	a1,0(a5)
    80006a98:	00d70733          	add	a4,a4,a3
    80006a9c:	00f73c23          	sd	a5,24(a4)
    80006aa0:	02c73023          	sd	a2,32(a4)
    80006aa4:	34071073          	csrw	mscratch,a4
    80006aa8:	00000797          	auipc	a5,0x0
    80006aac:	6e878793          	addi	a5,a5,1768 # 80007190 <timervec>
    80006ab0:	30579073          	csrw	mtvec,a5
    80006ab4:	300027f3          	csrr	a5,mstatus
    80006ab8:	0087e793          	ori	a5,a5,8
    80006abc:	30079073          	csrw	mstatus,a5
    80006ac0:	304027f3          	csrr	a5,mie
    80006ac4:	0807e793          	ori	a5,a5,128
    80006ac8:	30479073          	csrw	mie,a5
    80006acc:	f14027f3          	csrr	a5,mhartid
    80006ad0:	0007879b          	sext.w	a5,a5
    80006ad4:	00078213          	mv	tp,a5
    80006ad8:	30200073          	mret
    80006adc:	00813403          	ld	s0,8(sp)
    80006ae0:	01010113          	addi	sp,sp,16
    80006ae4:	00008067          	ret

0000000080006ae8 <timerinit>:
    80006ae8:	ff010113          	addi	sp,sp,-16
    80006aec:	00813423          	sd	s0,8(sp)
    80006af0:	01010413          	addi	s0,sp,16
    80006af4:	f14027f3          	csrr	a5,mhartid
    80006af8:	0200c737          	lui	a4,0x200c
    80006afc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006b00:	0007869b          	sext.w	a3,a5
    80006b04:	00269713          	slli	a4,a3,0x2
    80006b08:	000f4637          	lui	a2,0xf4
    80006b0c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006b10:	00d70733          	add	a4,a4,a3
    80006b14:	0037979b          	slliw	a5,a5,0x3
    80006b18:	020046b7          	lui	a3,0x2004
    80006b1c:	00d787b3          	add	a5,a5,a3
    80006b20:	00c585b3          	add	a1,a1,a2
    80006b24:	00371693          	slli	a3,a4,0x3
    80006b28:	00005717          	auipc	a4,0x5
    80006b2c:	5f870713          	addi	a4,a4,1528 # 8000c120 <timer_scratch>
    80006b30:	00b7b023          	sd	a1,0(a5)
    80006b34:	00d70733          	add	a4,a4,a3
    80006b38:	00f73c23          	sd	a5,24(a4)
    80006b3c:	02c73023          	sd	a2,32(a4)
    80006b40:	34071073          	csrw	mscratch,a4
    80006b44:	00000797          	auipc	a5,0x0
    80006b48:	64c78793          	addi	a5,a5,1612 # 80007190 <timervec>
    80006b4c:	30579073          	csrw	mtvec,a5
    80006b50:	300027f3          	csrr	a5,mstatus
    80006b54:	0087e793          	ori	a5,a5,8
    80006b58:	30079073          	csrw	mstatus,a5
    80006b5c:	304027f3          	csrr	a5,mie
    80006b60:	0807e793          	ori	a5,a5,128
    80006b64:	30479073          	csrw	mie,a5
    80006b68:	00813403          	ld	s0,8(sp)
    80006b6c:	01010113          	addi	sp,sp,16
    80006b70:	00008067          	ret

0000000080006b74 <system_main>:
    80006b74:	fe010113          	addi	sp,sp,-32
    80006b78:	00813823          	sd	s0,16(sp)
    80006b7c:	00913423          	sd	s1,8(sp)
    80006b80:	00113c23          	sd	ra,24(sp)
    80006b84:	02010413          	addi	s0,sp,32
    80006b88:	00000097          	auipc	ra,0x0
    80006b8c:	0c4080e7          	jalr	196(ra) # 80006c4c <cpuid>
    80006b90:	00005497          	auipc	s1,0x5
    80006b94:	c9048493          	addi	s1,s1,-880 # 8000b820 <started>
    80006b98:	02050263          	beqz	a0,80006bbc <system_main+0x48>
    80006b9c:	0004a783          	lw	a5,0(s1)
    80006ba0:	0007879b          	sext.w	a5,a5
    80006ba4:	fe078ce3          	beqz	a5,80006b9c <system_main+0x28>
    80006ba8:	0ff0000f          	fence
    80006bac:	00003517          	auipc	a0,0x3
    80006bb0:	a4450513          	addi	a0,a0,-1468 # 800095f0 <CONSOLE_STATUS+0x5e0>
    80006bb4:	00001097          	auipc	ra,0x1
    80006bb8:	a78080e7          	jalr	-1416(ra) # 8000762c <panic>
    80006bbc:	00001097          	auipc	ra,0x1
    80006bc0:	9cc080e7          	jalr	-1588(ra) # 80007588 <consoleinit>
    80006bc4:	00001097          	auipc	ra,0x1
    80006bc8:	158080e7          	jalr	344(ra) # 80007d1c <printfinit>
    80006bcc:	00003517          	auipc	a0,0x3
    80006bd0:	8ac50513          	addi	a0,a0,-1876 # 80009478 <CONSOLE_STATUS+0x468>
    80006bd4:	00001097          	auipc	ra,0x1
    80006bd8:	ab4080e7          	jalr	-1356(ra) # 80007688 <__printf>
    80006bdc:	00003517          	auipc	a0,0x3
    80006be0:	9e450513          	addi	a0,a0,-1564 # 800095c0 <CONSOLE_STATUS+0x5b0>
    80006be4:	00001097          	auipc	ra,0x1
    80006be8:	aa4080e7          	jalr	-1372(ra) # 80007688 <__printf>
    80006bec:	00003517          	auipc	a0,0x3
    80006bf0:	88c50513          	addi	a0,a0,-1908 # 80009478 <CONSOLE_STATUS+0x468>
    80006bf4:	00001097          	auipc	ra,0x1
    80006bf8:	a94080e7          	jalr	-1388(ra) # 80007688 <__printf>
    80006bfc:	00001097          	auipc	ra,0x1
    80006c00:	4ac080e7          	jalr	1196(ra) # 800080a8 <kinit>
    80006c04:	00000097          	auipc	ra,0x0
    80006c08:	148080e7          	jalr	328(ra) # 80006d4c <trapinit>
    80006c0c:	00000097          	auipc	ra,0x0
    80006c10:	16c080e7          	jalr	364(ra) # 80006d78 <trapinithart>
    80006c14:	00000097          	auipc	ra,0x0
    80006c18:	5bc080e7          	jalr	1468(ra) # 800071d0 <plicinit>
    80006c1c:	00000097          	auipc	ra,0x0
    80006c20:	5dc080e7          	jalr	1500(ra) # 800071f8 <plicinithart>
    80006c24:	00000097          	auipc	ra,0x0
    80006c28:	078080e7          	jalr	120(ra) # 80006c9c <userinit>
    80006c2c:	0ff0000f          	fence
    80006c30:	00100793          	li	a5,1
    80006c34:	00003517          	auipc	a0,0x3
    80006c38:	9a450513          	addi	a0,a0,-1628 # 800095d8 <CONSOLE_STATUS+0x5c8>
    80006c3c:	00f4a023          	sw	a5,0(s1)
    80006c40:	00001097          	auipc	ra,0x1
    80006c44:	a48080e7          	jalr	-1464(ra) # 80007688 <__printf>
    80006c48:	0000006f          	j	80006c48 <system_main+0xd4>

0000000080006c4c <cpuid>:
    80006c4c:	ff010113          	addi	sp,sp,-16
    80006c50:	00813423          	sd	s0,8(sp)
    80006c54:	01010413          	addi	s0,sp,16
    80006c58:	00020513          	mv	a0,tp
    80006c5c:	00813403          	ld	s0,8(sp)
    80006c60:	0005051b          	sext.w	a0,a0
    80006c64:	01010113          	addi	sp,sp,16
    80006c68:	00008067          	ret

0000000080006c6c <mycpu>:
    80006c6c:	ff010113          	addi	sp,sp,-16
    80006c70:	00813423          	sd	s0,8(sp)
    80006c74:	01010413          	addi	s0,sp,16
    80006c78:	00020793          	mv	a5,tp
    80006c7c:	00813403          	ld	s0,8(sp)
    80006c80:	0007879b          	sext.w	a5,a5
    80006c84:	00779793          	slli	a5,a5,0x7
    80006c88:	00006517          	auipc	a0,0x6
    80006c8c:	4c850513          	addi	a0,a0,1224 # 8000d150 <cpus>
    80006c90:	00f50533          	add	a0,a0,a5
    80006c94:	01010113          	addi	sp,sp,16
    80006c98:	00008067          	ret

0000000080006c9c <userinit>:
    80006c9c:	ff010113          	addi	sp,sp,-16
    80006ca0:	00813423          	sd	s0,8(sp)
    80006ca4:	01010413          	addi	s0,sp,16
    80006ca8:	00813403          	ld	s0,8(sp)
    80006cac:	01010113          	addi	sp,sp,16
    80006cb0:	ffffb317          	auipc	t1,0xffffb
    80006cb4:	eb030067          	jr	-336(t1) # 80001b60 <main>

0000000080006cb8 <either_copyout>:
    80006cb8:	ff010113          	addi	sp,sp,-16
    80006cbc:	00813023          	sd	s0,0(sp)
    80006cc0:	00113423          	sd	ra,8(sp)
    80006cc4:	01010413          	addi	s0,sp,16
    80006cc8:	02051663          	bnez	a0,80006cf4 <either_copyout+0x3c>
    80006ccc:	00058513          	mv	a0,a1
    80006cd0:	00060593          	mv	a1,a2
    80006cd4:	0006861b          	sext.w	a2,a3
    80006cd8:	00002097          	auipc	ra,0x2
    80006cdc:	c5c080e7          	jalr	-932(ra) # 80008934 <__memmove>
    80006ce0:	00813083          	ld	ra,8(sp)
    80006ce4:	00013403          	ld	s0,0(sp)
    80006ce8:	00000513          	li	a0,0
    80006cec:	01010113          	addi	sp,sp,16
    80006cf0:	00008067          	ret
    80006cf4:	00003517          	auipc	a0,0x3
    80006cf8:	92450513          	addi	a0,a0,-1756 # 80009618 <CONSOLE_STATUS+0x608>
    80006cfc:	00001097          	auipc	ra,0x1
    80006d00:	930080e7          	jalr	-1744(ra) # 8000762c <panic>

0000000080006d04 <either_copyin>:
    80006d04:	ff010113          	addi	sp,sp,-16
    80006d08:	00813023          	sd	s0,0(sp)
    80006d0c:	00113423          	sd	ra,8(sp)
    80006d10:	01010413          	addi	s0,sp,16
    80006d14:	02059463          	bnez	a1,80006d3c <either_copyin+0x38>
    80006d18:	00060593          	mv	a1,a2
    80006d1c:	0006861b          	sext.w	a2,a3
    80006d20:	00002097          	auipc	ra,0x2
    80006d24:	c14080e7          	jalr	-1004(ra) # 80008934 <__memmove>
    80006d28:	00813083          	ld	ra,8(sp)
    80006d2c:	00013403          	ld	s0,0(sp)
    80006d30:	00000513          	li	a0,0
    80006d34:	01010113          	addi	sp,sp,16
    80006d38:	00008067          	ret
    80006d3c:	00003517          	auipc	a0,0x3
    80006d40:	90450513          	addi	a0,a0,-1788 # 80009640 <CONSOLE_STATUS+0x630>
    80006d44:	00001097          	auipc	ra,0x1
    80006d48:	8e8080e7          	jalr	-1816(ra) # 8000762c <panic>

0000000080006d4c <trapinit>:
    80006d4c:	ff010113          	addi	sp,sp,-16
    80006d50:	00813423          	sd	s0,8(sp)
    80006d54:	01010413          	addi	s0,sp,16
    80006d58:	00813403          	ld	s0,8(sp)
    80006d5c:	00003597          	auipc	a1,0x3
    80006d60:	90c58593          	addi	a1,a1,-1780 # 80009668 <CONSOLE_STATUS+0x658>
    80006d64:	00006517          	auipc	a0,0x6
    80006d68:	46c50513          	addi	a0,a0,1132 # 8000d1d0 <tickslock>
    80006d6c:	01010113          	addi	sp,sp,16
    80006d70:	00001317          	auipc	t1,0x1
    80006d74:	5c830067          	jr	1480(t1) # 80008338 <initlock>

0000000080006d78 <trapinithart>:
    80006d78:	ff010113          	addi	sp,sp,-16
    80006d7c:	00813423          	sd	s0,8(sp)
    80006d80:	01010413          	addi	s0,sp,16
    80006d84:	00000797          	auipc	a5,0x0
    80006d88:	2fc78793          	addi	a5,a5,764 # 80007080 <kernelvec>
    80006d8c:	10579073          	csrw	stvec,a5
    80006d90:	00813403          	ld	s0,8(sp)
    80006d94:	01010113          	addi	sp,sp,16
    80006d98:	00008067          	ret

0000000080006d9c <usertrap>:
    80006d9c:	ff010113          	addi	sp,sp,-16
    80006da0:	00813423          	sd	s0,8(sp)
    80006da4:	01010413          	addi	s0,sp,16
    80006da8:	00813403          	ld	s0,8(sp)
    80006dac:	01010113          	addi	sp,sp,16
    80006db0:	00008067          	ret

0000000080006db4 <usertrapret>:
    80006db4:	ff010113          	addi	sp,sp,-16
    80006db8:	00813423          	sd	s0,8(sp)
    80006dbc:	01010413          	addi	s0,sp,16
    80006dc0:	00813403          	ld	s0,8(sp)
    80006dc4:	01010113          	addi	sp,sp,16
    80006dc8:	00008067          	ret

0000000080006dcc <kerneltrap>:
    80006dcc:	fe010113          	addi	sp,sp,-32
    80006dd0:	00813823          	sd	s0,16(sp)
    80006dd4:	00113c23          	sd	ra,24(sp)
    80006dd8:	00913423          	sd	s1,8(sp)
    80006ddc:	02010413          	addi	s0,sp,32
    80006de0:	142025f3          	csrr	a1,scause
    80006de4:	100027f3          	csrr	a5,sstatus
    80006de8:	0027f793          	andi	a5,a5,2
    80006dec:	10079c63          	bnez	a5,80006f04 <kerneltrap+0x138>
    80006df0:	142027f3          	csrr	a5,scause
    80006df4:	0207ce63          	bltz	a5,80006e30 <kerneltrap+0x64>
    80006df8:	00003517          	auipc	a0,0x3
    80006dfc:	8b850513          	addi	a0,a0,-1864 # 800096b0 <CONSOLE_STATUS+0x6a0>
    80006e00:	00001097          	auipc	ra,0x1
    80006e04:	888080e7          	jalr	-1912(ra) # 80007688 <__printf>
    80006e08:	141025f3          	csrr	a1,sepc
    80006e0c:	14302673          	csrr	a2,stval
    80006e10:	00003517          	auipc	a0,0x3
    80006e14:	8b050513          	addi	a0,a0,-1872 # 800096c0 <CONSOLE_STATUS+0x6b0>
    80006e18:	00001097          	auipc	ra,0x1
    80006e1c:	870080e7          	jalr	-1936(ra) # 80007688 <__printf>
    80006e20:	00003517          	auipc	a0,0x3
    80006e24:	8b850513          	addi	a0,a0,-1864 # 800096d8 <CONSOLE_STATUS+0x6c8>
    80006e28:	00001097          	auipc	ra,0x1
    80006e2c:	804080e7          	jalr	-2044(ra) # 8000762c <panic>
    80006e30:	0ff7f713          	andi	a4,a5,255
    80006e34:	00900693          	li	a3,9
    80006e38:	04d70063          	beq	a4,a3,80006e78 <kerneltrap+0xac>
    80006e3c:	fff00713          	li	a4,-1
    80006e40:	03f71713          	slli	a4,a4,0x3f
    80006e44:	00170713          	addi	a4,a4,1
    80006e48:	fae798e3          	bne	a5,a4,80006df8 <kerneltrap+0x2c>
    80006e4c:	00000097          	auipc	ra,0x0
    80006e50:	e00080e7          	jalr	-512(ra) # 80006c4c <cpuid>
    80006e54:	06050663          	beqz	a0,80006ec0 <kerneltrap+0xf4>
    80006e58:	144027f3          	csrr	a5,sip
    80006e5c:	ffd7f793          	andi	a5,a5,-3
    80006e60:	14479073          	csrw	sip,a5
    80006e64:	01813083          	ld	ra,24(sp)
    80006e68:	01013403          	ld	s0,16(sp)
    80006e6c:	00813483          	ld	s1,8(sp)
    80006e70:	02010113          	addi	sp,sp,32
    80006e74:	00008067          	ret
    80006e78:	00000097          	auipc	ra,0x0
    80006e7c:	3cc080e7          	jalr	972(ra) # 80007244 <plic_claim>
    80006e80:	00a00793          	li	a5,10
    80006e84:	00050493          	mv	s1,a0
    80006e88:	06f50863          	beq	a0,a5,80006ef8 <kerneltrap+0x12c>
    80006e8c:	fc050ce3          	beqz	a0,80006e64 <kerneltrap+0x98>
    80006e90:	00050593          	mv	a1,a0
    80006e94:	00002517          	auipc	a0,0x2
    80006e98:	7fc50513          	addi	a0,a0,2044 # 80009690 <CONSOLE_STATUS+0x680>
    80006e9c:	00000097          	auipc	ra,0x0
    80006ea0:	7ec080e7          	jalr	2028(ra) # 80007688 <__printf>
    80006ea4:	01013403          	ld	s0,16(sp)
    80006ea8:	01813083          	ld	ra,24(sp)
    80006eac:	00048513          	mv	a0,s1
    80006eb0:	00813483          	ld	s1,8(sp)
    80006eb4:	02010113          	addi	sp,sp,32
    80006eb8:	00000317          	auipc	t1,0x0
    80006ebc:	3c430067          	jr	964(t1) # 8000727c <plic_complete>
    80006ec0:	00006517          	auipc	a0,0x6
    80006ec4:	31050513          	addi	a0,a0,784 # 8000d1d0 <tickslock>
    80006ec8:	00001097          	auipc	ra,0x1
    80006ecc:	494080e7          	jalr	1172(ra) # 8000835c <acquire>
    80006ed0:	00005717          	auipc	a4,0x5
    80006ed4:	95470713          	addi	a4,a4,-1708 # 8000b824 <ticks>
    80006ed8:	00072783          	lw	a5,0(a4)
    80006edc:	00006517          	auipc	a0,0x6
    80006ee0:	2f450513          	addi	a0,a0,756 # 8000d1d0 <tickslock>
    80006ee4:	0017879b          	addiw	a5,a5,1
    80006ee8:	00f72023          	sw	a5,0(a4)
    80006eec:	00001097          	auipc	ra,0x1
    80006ef0:	53c080e7          	jalr	1340(ra) # 80008428 <release>
    80006ef4:	f65ff06f          	j	80006e58 <kerneltrap+0x8c>
    80006ef8:	00001097          	auipc	ra,0x1
    80006efc:	098080e7          	jalr	152(ra) # 80007f90 <uartintr>
    80006f00:	fa5ff06f          	j	80006ea4 <kerneltrap+0xd8>
    80006f04:	00002517          	auipc	a0,0x2
    80006f08:	76c50513          	addi	a0,a0,1900 # 80009670 <CONSOLE_STATUS+0x660>
    80006f0c:	00000097          	auipc	ra,0x0
    80006f10:	720080e7          	jalr	1824(ra) # 8000762c <panic>

0000000080006f14 <clockintr>:
    80006f14:	fe010113          	addi	sp,sp,-32
    80006f18:	00813823          	sd	s0,16(sp)
    80006f1c:	00913423          	sd	s1,8(sp)
    80006f20:	00113c23          	sd	ra,24(sp)
    80006f24:	02010413          	addi	s0,sp,32
    80006f28:	00006497          	auipc	s1,0x6
    80006f2c:	2a848493          	addi	s1,s1,680 # 8000d1d0 <tickslock>
    80006f30:	00048513          	mv	a0,s1
    80006f34:	00001097          	auipc	ra,0x1
    80006f38:	428080e7          	jalr	1064(ra) # 8000835c <acquire>
    80006f3c:	00005717          	auipc	a4,0x5
    80006f40:	8e870713          	addi	a4,a4,-1816 # 8000b824 <ticks>
    80006f44:	00072783          	lw	a5,0(a4)
    80006f48:	01013403          	ld	s0,16(sp)
    80006f4c:	01813083          	ld	ra,24(sp)
    80006f50:	00048513          	mv	a0,s1
    80006f54:	0017879b          	addiw	a5,a5,1
    80006f58:	00813483          	ld	s1,8(sp)
    80006f5c:	00f72023          	sw	a5,0(a4)
    80006f60:	02010113          	addi	sp,sp,32
    80006f64:	00001317          	auipc	t1,0x1
    80006f68:	4c430067          	jr	1220(t1) # 80008428 <release>

0000000080006f6c <devintr>:
    80006f6c:	142027f3          	csrr	a5,scause
    80006f70:	00000513          	li	a0,0
    80006f74:	0007c463          	bltz	a5,80006f7c <devintr+0x10>
    80006f78:	00008067          	ret
    80006f7c:	fe010113          	addi	sp,sp,-32
    80006f80:	00813823          	sd	s0,16(sp)
    80006f84:	00113c23          	sd	ra,24(sp)
    80006f88:	00913423          	sd	s1,8(sp)
    80006f8c:	02010413          	addi	s0,sp,32
    80006f90:	0ff7f713          	andi	a4,a5,255
    80006f94:	00900693          	li	a3,9
    80006f98:	04d70c63          	beq	a4,a3,80006ff0 <devintr+0x84>
    80006f9c:	fff00713          	li	a4,-1
    80006fa0:	03f71713          	slli	a4,a4,0x3f
    80006fa4:	00170713          	addi	a4,a4,1
    80006fa8:	00e78c63          	beq	a5,a4,80006fc0 <devintr+0x54>
    80006fac:	01813083          	ld	ra,24(sp)
    80006fb0:	01013403          	ld	s0,16(sp)
    80006fb4:	00813483          	ld	s1,8(sp)
    80006fb8:	02010113          	addi	sp,sp,32
    80006fbc:	00008067          	ret
    80006fc0:	00000097          	auipc	ra,0x0
    80006fc4:	c8c080e7          	jalr	-884(ra) # 80006c4c <cpuid>
    80006fc8:	06050663          	beqz	a0,80007034 <devintr+0xc8>
    80006fcc:	144027f3          	csrr	a5,sip
    80006fd0:	ffd7f793          	andi	a5,a5,-3
    80006fd4:	14479073          	csrw	sip,a5
    80006fd8:	01813083          	ld	ra,24(sp)
    80006fdc:	01013403          	ld	s0,16(sp)
    80006fe0:	00813483          	ld	s1,8(sp)
    80006fe4:	00200513          	li	a0,2
    80006fe8:	02010113          	addi	sp,sp,32
    80006fec:	00008067          	ret
    80006ff0:	00000097          	auipc	ra,0x0
    80006ff4:	254080e7          	jalr	596(ra) # 80007244 <plic_claim>
    80006ff8:	00a00793          	li	a5,10
    80006ffc:	00050493          	mv	s1,a0
    80007000:	06f50663          	beq	a0,a5,8000706c <devintr+0x100>
    80007004:	00100513          	li	a0,1
    80007008:	fa0482e3          	beqz	s1,80006fac <devintr+0x40>
    8000700c:	00048593          	mv	a1,s1
    80007010:	00002517          	auipc	a0,0x2
    80007014:	68050513          	addi	a0,a0,1664 # 80009690 <CONSOLE_STATUS+0x680>
    80007018:	00000097          	auipc	ra,0x0
    8000701c:	670080e7          	jalr	1648(ra) # 80007688 <__printf>
    80007020:	00048513          	mv	a0,s1
    80007024:	00000097          	auipc	ra,0x0
    80007028:	258080e7          	jalr	600(ra) # 8000727c <plic_complete>
    8000702c:	00100513          	li	a0,1
    80007030:	f7dff06f          	j	80006fac <devintr+0x40>
    80007034:	00006517          	auipc	a0,0x6
    80007038:	19c50513          	addi	a0,a0,412 # 8000d1d0 <tickslock>
    8000703c:	00001097          	auipc	ra,0x1
    80007040:	320080e7          	jalr	800(ra) # 8000835c <acquire>
    80007044:	00004717          	auipc	a4,0x4
    80007048:	7e070713          	addi	a4,a4,2016 # 8000b824 <ticks>
    8000704c:	00072783          	lw	a5,0(a4)
    80007050:	00006517          	auipc	a0,0x6
    80007054:	18050513          	addi	a0,a0,384 # 8000d1d0 <tickslock>
    80007058:	0017879b          	addiw	a5,a5,1
    8000705c:	00f72023          	sw	a5,0(a4)
    80007060:	00001097          	auipc	ra,0x1
    80007064:	3c8080e7          	jalr	968(ra) # 80008428 <release>
    80007068:	f65ff06f          	j	80006fcc <devintr+0x60>
    8000706c:	00001097          	auipc	ra,0x1
    80007070:	f24080e7          	jalr	-220(ra) # 80007f90 <uartintr>
    80007074:	fadff06f          	j	80007020 <devintr+0xb4>
	...

0000000080007080 <kernelvec>:
    80007080:	f0010113          	addi	sp,sp,-256
    80007084:	00113023          	sd	ra,0(sp)
    80007088:	00213423          	sd	sp,8(sp)
    8000708c:	00313823          	sd	gp,16(sp)
    80007090:	00413c23          	sd	tp,24(sp)
    80007094:	02513023          	sd	t0,32(sp)
    80007098:	02613423          	sd	t1,40(sp)
    8000709c:	02713823          	sd	t2,48(sp)
    800070a0:	02813c23          	sd	s0,56(sp)
    800070a4:	04913023          	sd	s1,64(sp)
    800070a8:	04a13423          	sd	a0,72(sp)
    800070ac:	04b13823          	sd	a1,80(sp)
    800070b0:	04c13c23          	sd	a2,88(sp)
    800070b4:	06d13023          	sd	a3,96(sp)
    800070b8:	06e13423          	sd	a4,104(sp)
    800070bc:	06f13823          	sd	a5,112(sp)
    800070c0:	07013c23          	sd	a6,120(sp)
    800070c4:	09113023          	sd	a7,128(sp)
    800070c8:	09213423          	sd	s2,136(sp)
    800070cc:	09313823          	sd	s3,144(sp)
    800070d0:	09413c23          	sd	s4,152(sp)
    800070d4:	0b513023          	sd	s5,160(sp)
    800070d8:	0b613423          	sd	s6,168(sp)
    800070dc:	0b713823          	sd	s7,176(sp)
    800070e0:	0b813c23          	sd	s8,184(sp)
    800070e4:	0d913023          	sd	s9,192(sp)
    800070e8:	0da13423          	sd	s10,200(sp)
    800070ec:	0db13823          	sd	s11,208(sp)
    800070f0:	0dc13c23          	sd	t3,216(sp)
    800070f4:	0fd13023          	sd	t4,224(sp)
    800070f8:	0fe13423          	sd	t5,232(sp)
    800070fc:	0ff13823          	sd	t6,240(sp)
    80007100:	ccdff0ef          	jal	ra,80006dcc <kerneltrap>
    80007104:	00013083          	ld	ra,0(sp)
    80007108:	00813103          	ld	sp,8(sp)
    8000710c:	01013183          	ld	gp,16(sp)
    80007110:	02013283          	ld	t0,32(sp)
    80007114:	02813303          	ld	t1,40(sp)
    80007118:	03013383          	ld	t2,48(sp)
    8000711c:	03813403          	ld	s0,56(sp)
    80007120:	04013483          	ld	s1,64(sp)
    80007124:	04813503          	ld	a0,72(sp)
    80007128:	05013583          	ld	a1,80(sp)
    8000712c:	05813603          	ld	a2,88(sp)
    80007130:	06013683          	ld	a3,96(sp)
    80007134:	06813703          	ld	a4,104(sp)
    80007138:	07013783          	ld	a5,112(sp)
    8000713c:	07813803          	ld	a6,120(sp)
    80007140:	08013883          	ld	a7,128(sp)
    80007144:	08813903          	ld	s2,136(sp)
    80007148:	09013983          	ld	s3,144(sp)
    8000714c:	09813a03          	ld	s4,152(sp)
    80007150:	0a013a83          	ld	s5,160(sp)
    80007154:	0a813b03          	ld	s6,168(sp)
    80007158:	0b013b83          	ld	s7,176(sp)
    8000715c:	0b813c03          	ld	s8,184(sp)
    80007160:	0c013c83          	ld	s9,192(sp)
    80007164:	0c813d03          	ld	s10,200(sp)
    80007168:	0d013d83          	ld	s11,208(sp)
    8000716c:	0d813e03          	ld	t3,216(sp)
    80007170:	0e013e83          	ld	t4,224(sp)
    80007174:	0e813f03          	ld	t5,232(sp)
    80007178:	0f013f83          	ld	t6,240(sp)
    8000717c:	10010113          	addi	sp,sp,256
    80007180:	10200073          	sret
    80007184:	00000013          	nop
    80007188:	00000013          	nop
    8000718c:	00000013          	nop

0000000080007190 <timervec>:
    80007190:	34051573          	csrrw	a0,mscratch,a0
    80007194:	00b53023          	sd	a1,0(a0)
    80007198:	00c53423          	sd	a2,8(a0)
    8000719c:	00d53823          	sd	a3,16(a0)
    800071a0:	01853583          	ld	a1,24(a0)
    800071a4:	02053603          	ld	a2,32(a0)
    800071a8:	0005b683          	ld	a3,0(a1)
    800071ac:	00c686b3          	add	a3,a3,a2
    800071b0:	00d5b023          	sd	a3,0(a1)
    800071b4:	00200593          	li	a1,2
    800071b8:	14459073          	csrw	sip,a1
    800071bc:	01053683          	ld	a3,16(a0)
    800071c0:	00853603          	ld	a2,8(a0)
    800071c4:	00053583          	ld	a1,0(a0)
    800071c8:	34051573          	csrrw	a0,mscratch,a0
    800071cc:	30200073          	mret

00000000800071d0 <plicinit>:
    800071d0:	ff010113          	addi	sp,sp,-16
    800071d4:	00813423          	sd	s0,8(sp)
    800071d8:	01010413          	addi	s0,sp,16
    800071dc:	00813403          	ld	s0,8(sp)
    800071e0:	0c0007b7          	lui	a5,0xc000
    800071e4:	00100713          	li	a4,1
    800071e8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800071ec:	00e7a223          	sw	a4,4(a5)
    800071f0:	01010113          	addi	sp,sp,16
    800071f4:	00008067          	ret

00000000800071f8 <plicinithart>:
    800071f8:	ff010113          	addi	sp,sp,-16
    800071fc:	00813023          	sd	s0,0(sp)
    80007200:	00113423          	sd	ra,8(sp)
    80007204:	01010413          	addi	s0,sp,16
    80007208:	00000097          	auipc	ra,0x0
    8000720c:	a44080e7          	jalr	-1468(ra) # 80006c4c <cpuid>
    80007210:	0085171b          	slliw	a4,a0,0x8
    80007214:	0c0027b7          	lui	a5,0xc002
    80007218:	00e787b3          	add	a5,a5,a4
    8000721c:	40200713          	li	a4,1026
    80007220:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007224:	00813083          	ld	ra,8(sp)
    80007228:	00013403          	ld	s0,0(sp)
    8000722c:	00d5151b          	slliw	a0,a0,0xd
    80007230:	0c2017b7          	lui	a5,0xc201
    80007234:	00a78533          	add	a0,a5,a0
    80007238:	00052023          	sw	zero,0(a0)
    8000723c:	01010113          	addi	sp,sp,16
    80007240:	00008067          	ret

0000000080007244 <plic_claim>:
    80007244:	ff010113          	addi	sp,sp,-16
    80007248:	00813023          	sd	s0,0(sp)
    8000724c:	00113423          	sd	ra,8(sp)
    80007250:	01010413          	addi	s0,sp,16
    80007254:	00000097          	auipc	ra,0x0
    80007258:	9f8080e7          	jalr	-1544(ra) # 80006c4c <cpuid>
    8000725c:	00813083          	ld	ra,8(sp)
    80007260:	00013403          	ld	s0,0(sp)
    80007264:	00d5151b          	slliw	a0,a0,0xd
    80007268:	0c2017b7          	lui	a5,0xc201
    8000726c:	00a78533          	add	a0,a5,a0
    80007270:	00452503          	lw	a0,4(a0)
    80007274:	01010113          	addi	sp,sp,16
    80007278:	00008067          	ret

000000008000727c <plic_complete>:
    8000727c:	fe010113          	addi	sp,sp,-32
    80007280:	00813823          	sd	s0,16(sp)
    80007284:	00913423          	sd	s1,8(sp)
    80007288:	00113c23          	sd	ra,24(sp)
    8000728c:	02010413          	addi	s0,sp,32
    80007290:	00050493          	mv	s1,a0
    80007294:	00000097          	auipc	ra,0x0
    80007298:	9b8080e7          	jalr	-1608(ra) # 80006c4c <cpuid>
    8000729c:	01813083          	ld	ra,24(sp)
    800072a0:	01013403          	ld	s0,16(sp)
    800072a4:	00d5179b          	slliw	a5,a0,0xd
    800072a8:	0c201737          	lui	a4,0xc201
    800072ac:	00f707b3          	add	a5,a4,a5
    800072b0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800072b4:	00813483          	ld	s1,8(sp)
    800072b8:	02010113          	addi	sp,sp,32
    800072bc:	00008067          	ret

00000000800072c0 <consolewrite>:
    800072c0:	fb010113          	addi	sp,sp,-80
    800072c4:	04813023          	sd	s0,64(sp)
    800072c8:	04113423          	sd	ra,72(sp)
    800072cc:	02913c23          	sd	s1,56(sp)
    800072d0:	03213823          	sd	s2,48(sp)
    800072d4:	03313423          	sd	s3,40(sp)
    800072d8:	03413023          	sd	s4,32(sp)
    800072dc:	01513c23          	sd	s5,24(sp)
    800072e0:	05010413          	addi	s0,sp,80
    800072e4:	06c05c63          	blez	a2,8000735c <consolewrite+0x9c>
    800072e8:	00060993          	mv	s3,a2
    800072ec:	00050a13          	mv	s4,a0
    800072f0:	00058493          	mv	s1,a1
    800072f4:	00000913          	li	s2,0
    800072f8:	fff00a93          	li	s5,-1
    800072fc:	01c0006f          	j	80007318 <consolewrite+0x58>
    80007300:	fbf44503          	lbu	a0,-65(s0)
    80007304:	0019091b          	addiw	s2,s2,1
    80007308:	00148493          	addi	s1,s1,1
    8000730c:	00001097          	auipc	ra,0x1
    80007310:	a9c080e7          	jalr	-1380(ra) # 80007da8 <uartputc>
    80007314:	03298063          	beq	s3,s2,80007334 <consolewrite+0x74>
    80007318:	00048613          	mv	a2,s1
    8000731c:	00100693          	li	a3,1
    80007320:	000a0593          	mv	a1,s4
    80007324:	fbf40513          	addi	a0,s0,-65
    80007328:	00000097          	auipc	ra,0x0
    8000732c:	9dc080e7          	jalr	-1572(ra) # 80006d04 <either_copyin>
    80007330:	fd5518e3          	bne	a0,s5,80007300 <consolewrite+0x40>
    80007334:	04813083          	ld	ra,72(sp)
    80007338:	04013403          	ld	s0,64(sp)
    8000733c:	03813483          	ld	s1,56(sp)
    80007340:	02813983          	ld	s3,40(sp)
    80007344:	02013a03          	ld	s4,32(sp)
    80007348:	01813a83          	ld	s5,24(sp)
    8000734c:	00090513          	mv	a0,s2
    80007350:	03013903          	ld	s2,48(sp)
    80007354:	05010113          	addi	sp,sp,80
    80007358:	00008067          	ret
    8000735c:	00000913          	li	s2,0
    80007360:	fd5ff06f          	j	80007334 <consolewrite+0x74>

0000000080007364 <consoleread>:
    80007364:	f9010113          	addi	sp,sp,-112
    80007368:	06813023          	sd	s0,96(sp)
    8000736c:	04913c23          	sd	s1,88(sp)
    80007370:	05213823          	sd	s2,80(sp)
    80007374:	05313423          	sd	s3,72(sp)
    80007378:	05413023          	sd	s4,64(sp)
    8000737c:	03513c23          	sd	s5,56(sp)
    80007380:	03613823          	sd	s6,48(sp)
    80007384:	03713423          	sd	s7,40(sp)
    80007388:	03813023          	sd	s8,32(sp)
    8000738c:	06113423          	sd	ra,104(sp)
    80007390:	01913c23          	sd	s9,24(sp)
    80007394:	07010413          	addi	s0,sp,112
    80007398:	00060b93          	mv	s7,a2
    8000739c:	00050913          	mv	s2,a0
    800073a0:	00058c13          	mv	s8,a1
    800073a4:	00060b1b          	sext.w	s6,a2
    800073a8:	00006497          	auipc	s1,0x6
    800073ac:	e5048493          	addi	s1,s1,-432 # 8000d1f8 <cons>
    800073b0:	00400993          	li	s3,4
    800073b4:	fff00a13          	li	s4,-1
    800073b8:	00a00a93          	li	s5,10
    800073bc:	05705e63          	blez	s7,80007418 <consoleread+0xb4>
    800073c0:	09c4a703          	lw	a4,156(s1)
    800073c4:	0984a783          	lw	a5,152(s1)
    800073c8:	0007071b          	sext.w	a4,a4
    800073cc:	08e78463          	beq	a5,a4,80007454 <consoleread+0xf0>
    800073d0:	07f7f713          	andi	a4,a5,127
    800073d4:	00e48733          	add	a4,s1,a4
    800073d8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800073dc:	0017869b          	addiw	a3,a5,1
    800073e0:	08d4ac23          	sw	a3,152(s1)
    800073e4:	00070c9b          	sext.w	s9,a4
    800073e8:	0b370663          	beq	a4,s3,80007494 <consoleread+0x130>
    800073ec:	00100693          	li	a3,1
    800073f0:	f9f40613          	addi	a2,s0,-97
    800073f4:	000c0593          	mv	a1,s8
    800073f8:	00090513          	mv	a0,s2
    800073fc:	f8e40fa3          	sb	a4,-97(s0)
    80007400:	00000097          	auipc	ra,0x0
    80007404:	8b8080e7          	jalr	-1864(ra) # 80006cb8 <either_copyout>
    80007408:	01450863          	beq	a0,s4,80007418 <consoleread+0xb4>
    8000740c:	001c0c13          	addi	s8,s8,1
    80007410:	fffb8b9b          	addiw	s7,s7,-1
    80007414:	fb5c94e3          	bne	s9,s5,800073bc <consoleread+0x58>
    80007418:	000b851b          	sext.w	a0,s7
    8000741c:	06813083          	ld	ra,104(sp)
    80007420:	06013403          	ld	s0,96(sp)
    80007424:	05813483          	ld	s1,88(sp)
    80007428:	05013903          	ld	s2,80(sp)
    8000742c:	04813983          	ld	s3,72(sp)
    80007430:	04013a03          	ld	s4,64(sp)
    80007434:	03813a83          	ld	s5,56(sp)
    80007438:	02813b83          	ld	s7,40(sp)
    8000743c:	02013c03          	ld	s8,32(sp)
    80007440:	01813c83          	ld	s9,24(sp)
    80007444:	40ab053b          	subw	a0,s6,a0
    80007448:	03013b03          	ld	s6,48(sp)
    8000744c:	07010113          	addi	sp,sp,112
    80007450:	00008067          	ret
    80007454:	00001097          	auipc	ra,0x1
    80007458:	1d8080e7          	jalr	472(ra) # 8000862c <push_on>
    8000745c:	0984a703          	lw	a4,152(s1)
    80007460:	09c4a783          	lw	a5,156(s1)
    80007464:	0007879b          	sext.w	a5,a5
    80007468:	fef70ce3          	beq	a4,a5,80007460 <consoleread+0xfc>
    8000746c:	00001097          	auipc	ra,0x1
    80007470:	234080e7          	jalr	564(ra) # 800086a0 <pop_on>
    80007474:	0984a783          	lw	a5,152(s1)
    80007478:	07f7f713          	andi	a4,a5,127
    8000747c:	00e48733          	add	a4,s1,a4
    80007480:	01874703          	lbu	a4,24(a4)
    80007484:	0017869b          	addiw	a3,a5,1
    80007488:	08d4ac23          	sw	a3,152(s1)
    8000748c:	00070c9b          	sext.w	s9,a4
    80007490:	f5371ee3          	bne	a4,s3,800073ec <consoleread+0x88>
    80007494:	000b851b          	sext.w	a0,s7
    80007498:	f96bf2e3          	bgeu	s7,s6,8000741c <consoleread+0xb8>
    8000749c:	08f4ac23          	sw	a5,152(s1)
    800074a0:	f7dff06f          	j	8000741c <consoleread+0xb8>

00000000800074a4 <consputc>:
    800074a4:	10000793          	li	a5,256
    800074a8:	00f50663          	beq	a0,a5,800074b4 <consputc+0x10>
    800074ac:	00001317          	auipc	t1,0x1
    800074b0:	9f430067          	jr	-1548(t1) # 80007ea0 <uartputc_sync>
    800074b4:	ff010113          	addi	sp,sp,-16
    800074b8:	00113423          	sd	ra,8(sp)
    800074bc:	00813023          	sd	s0,0(sp)
    800074c0:	01010413          	addi	s0,sp,16
    800074c4:	00800513          	li	a0,8
    800074c8:	00001097          	auipc	ra,0x1
    800074cc:	9d8080e7          	jalr	-1576(ra) # 80007ea0 <uartputc_sync>
    800074d0:	02000513          	li	a0,32
    800074d4:	00001097          	auipc	ra,0x1
    800074d8:	9cc080e7          	jalr	-1588(ra) # 80007ea0 <uartputc_sync>
    800074dc:	00013403          	ld	s0,0(sp)
    800074e0:	00813083          	ld	ra,8(sp)
    800074e4:	00800513          	li	a0,8
    800074e8:	01010113          	addi	sp,sp,16
    800074ec:	00001317          	auipc	t1,0x1
    800074f0:	9b430067          	jr	-1612(t1) # 80007ea0 <uartputc_sync>

00000000800074f4 <consoleintr>:
    800074f4:	fe010113          	addi	sp,sp,-32
    800074f8:	00813823          	sd	s0,16(sp)
    800074fc:	00913423          	sd	s1,8(sp)
    80007500:	01213023          	sd	s2,0(sp)
    80007504:	00113c23          	sd	ra,24(sp)
    80007508:	02010413          	addi	s0,sp,32
    8000750c:	00006917          	auipc	s2,0x6
    80007510:	cec90913          	addi	s2,s2,-788 # 8000d1f8 <cons>
    80007514:	00050493          	mv	s1,a0
    80007518:	00090513          	mv	a0,s2
    8000751c:	00001097          	auipc	ra,0x1
    80007520:	e40080e7          	jalr	-448(ra) # 8000835c <acquire>
    80007524:	02048c63          	beqz	s1,8000755c <consoleintr+0x68>
    80007528:	0a092783          	lw	a5,160(s2)
    8000752c:	09892703          	lw	a4,152(s2)
    80007530:	07f00693          	li	a3,127
    80007534:	40e7873b          	subw	a4,a5,a4
    80007538:	02e6e263          	bltu	a3,a4,8000755c <consoleintr+0x68>
    8000753c:	00d00713          	li	a4,13
    80007540:	04e48063          	beq	s1,a4,80007580 <consoleintr+0x8c>
    80007544:	07f7f713          	andi	a4,a5,127
    80007548:	00e90733          	add	a4,s2,a4
    8000754c:	0017879b          	addiw	a5,a5,1
    80007550:	0af92023          	sw	a5,160(s2)
    80007554:	00970c23          	sb	s1,24(a4)
    80007558:	08f92e23          	sw	a5,156(s2)
    8000755c:	01013403          	ld	s0,16(sp)
    80007560:	01813083          	ld	ra,24(sp)
    80007564:	00813483          	ld	s1,8(sp)
    80007568:	00013903          	ld	s2,0(sp)
    8000756c:	00006517          	auipc	a0,0x6
    80007570:	c8c50513          	addi	a0,a0,-884 # 8000d1f8 <cons>
    80007574:	02010113          	addi	sp,sp,32
    80007578:	00001317          	auipc	t1,0x1
    8000757c:	eb030067          	jr	-336(t1) # 80008428 <release>
    80007580:	00a00493          	li	s1,10
    80007584:	fc1ff06f          	j	80007544 <consoleintr+0x50>

0000000080007588 <consoleinit>:
    80007588:	fe010113          	addi	sp,sp,-32
    8000758c:	00113c23          	sd	ra,24(sp)
    80007590:	00813823          	sd	s0,16(sp)
    80007594:	00913423          	sd	s1,8(sp)
    80007598:	02010413          	addi	s0,sp,32
    8000759c:	00006497          	auipc	s1,0x6
    800075a0:	c5c48493          	addi	s1,s1,-932 # 8000d1f8 <cons>
    800075a4:	00048513          	mv	a0,s1
    800075a8:	00002597          	auipc	a1,0x2
    800075ac:	14058593          	addi	a1,a1,320 # 800096e8 <CONSOLE_STATUS+0x6d8>
    800075b0:	00001097          	auipc	ra,0x1
    800075b4:	d88080e7          	jalr	-632(ra) # 80008338 <initlock>
    800075b8:	00000097          	auipc	ra,0x0
    800075bc:	7ac080e7          	jalr	1964(ra) # 80007d64 <uartinit>
    800075c0:	01813083          	ld	ra,24(sp)
    800075c4:	01013403          	ld	s0,16(sp)
    800075c8:	00000797          	auipc	a5,0x0
    800075cc:	d9c78793          	addi	a5,a5,-612 # 80007364 <consoleread>
    800075d0:	0af4bc23          	sd	a5,184(s1)
    800075d4:	00000797          	auipc	a5,0x0
    800075d8:	cec78793          	addi	a5,a5,-788 # 800072c0 <consolewrite>
    800075dc:	0cf4b023          	sd	a5,192(s1)
    800075e0:	00813483          	ld	s1,8(sp)
    800075e4:	02010113          	addi	sp,sp,32
    800075e8:	00008067          	ret

00000000800075ec <console_read>:
    800075ec:	ff010113          	addi	sp,sp,-16
    800075f0:	00813423          	sd	s0,8(sp)
    800075f4:	01010413          	addi	s0,sp,16
    800075f8:	00813403          	ld	s0,8(sp)
    800075fc:	00006317          	auipc	t1,0x6
    80007600:	cb433303          	ld	t1,-844(t1) # 8000d2b0 <devsw+0x10>
    80007604:	01010113          	addi	sp,sp,16
    80007608:	00030067          	jr	t1

000000008000760c <console_write>:
    8000760c:	ff010113          	addi	sp,sp,-16
    80007610:	00813423          	sd	s0,8(sp)
    80007614:	01010413          	addi	s0,sp,16
    80007618:	00813403          	ld	s0,8(sp)
    8000761c:	00006317          	auipc	t1,0x6
    80007620:	c9c33303          	ld	t1,-868(t1) # 8000d2b8 <devsw+0x18>
    80007624:	01010113          	addi	sp,sp,16
    80007628:	00030067          	jr	t1

000000008000762c <panic>:
    8000762c:	fe010113          	addi	sp,sp,-32
    80007630:	00113c23          	sd	ra,24(sp)
    80007634:	00813823          	sd	s0,16(sp)
    80007638:	00913423          	sd	s1,8(sp)
    8000763c:	02010413          	addi	s0,sp,32
    80007640:	00050493          	mv	s1,a0
    80007644:	00002517          	auipc	a0,0x2
    80007648:	0ac50513          	addi	a0,a0,172 # 800096f0 <CONSOLE_STATUS+0x6e0>
    8000764c:	00006797          	auipc	a5,0x6
    80007650:	d007a623          	sw	zero,-756(a5) # 8000d358 <pr+0x18>
    80007654:	00000097          	auipc	ra,0x0
    80007658:	034080e7          	jalr	52(ra) # 80007688 <__printf>
    8000765c:	00048513          	mv	a0,s1
    80007660:	00000097          	auipc	ra,0x0
    80007664:	028080e7          	jalr	40(ra) # 80007688 <__printf>
    80007668:	00002517          	auipc	a0,0x2
    8000766c:	e1050513          	addi	a0,a0,-496 # 80009478 <CONSOLE_STATUS+0x468>
    80007670:	00000097          	auipc	ra,0x0
    80007674:	018080e7          	jalr	24(ra) # 80007688 <__printf>
    80007678:	00100793          	li	a5,1
    8000767c:	00004717          	auipc	a4,0x4
    80007680:	1af72623          	sw	a5,428(a4) # 8000b828 <panicked>
    80007684:	0000006f          	j	80007684 <panic+0x58>

0000000080007688 <__printf>:
    80007688:	f3010113          	addi	sp,sp,-208
    8000768c:	08813023          	sd	s0,128(sp)
    80007690:	07313423          	sd	s3,104(sp)
    80007694:	09010413          	addi	s0,sp,144
    80007698:	05813023          	sd	s8,64(sp)
    8000769c:	08113423          	sd	ra,136(sp)
    800076a0:	06913c23          	sd	s1,120(sp)
    800076a4:	07213823          	sd	s2,112(sp)
    800076a8:	07413023          	sd	s4,96(sp)
    800076ac:	05513c23          	sd	s5,88(sp)
    800076b0:	05613823          	sd	s6,80(sp)
    800076b4:	05713423          	sd	s7,72(sp)
    800076b8:	03913c23          	sd	s9,56(sp)
    800076bc:	03a13823          	sd	s10,48(sp)
    800076c0:	03b13423          	sd	s11,40(sp)
    800076c4:	00006317          	auipc	t1,0x6
    800076c8:	c7c30313          	addi	t1,t1,-900 # 8000d340 <pr>
    800076cc:	01832c03          	lw	s8,24(t1)
    800076d0:	00b43423          	sd	a1,8(s0)
    800076d4:	00c43823          	sd	a2,16(s0)
    800076d8:	00d43c23          	sd	a3,24(s0)
    800076dc:	02e43023          	sd	a4,32(s0)
    800076e0:	02f43423          	sd	a5,40(s0)
    800076e4:	03043823          	sd	a6,48(s0)
    800076e8:	03143c23          	sd	a7,56(s0)
    800076ec:	00050993          	mv	s3,a0
    800076f0:	4a0c1663          	bnez	s8,80007b9c <__printf+0x514>
    800076f4:	60098c63          	beqz	s3,80007d0c <__printf+0x684>
    800076f8:	0009c503          	lbu	a0,0(s3)
    800076fc:	00840793          	addi	a5,s0,8
    80007700:	f6f43c23          	sd	a5,-136(s0)
    80007704:	00000493          	li	s1,0
    80007708:	22050063          	beqz	a0,80007928 <__printf+0x2a0>
    8000770c:	00002a37          	lui	s4,0x2
    80007710:	00018ab7          	lui	s5,0x18
    80007714:	000f4b37          	lui	s6,0xf4
    80007718:	00989bb7          	lui	s7,0x989
    8000771c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007720:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007724:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007728:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000772c:	00148c9b          	addiw	s9,s1,1
    80007730:	02500793          	li	a5,37
    80007734:	01998933          	add	s2,s3,s9
    80007738:	38f51263          	bne	a0,a5,80007abc <__printf+0x434>
    8000773c:	00094783          	lbu	a5,0(s2)
    80007740:	00078c9b          	sext.w	s9,a5
    80007744:	1e078263          	beqz	a5,80007928 <__printf+0x2a0>
    80007748:	0024849b          	addiw	s1,s1,2
    8000774c:	07000713          	li	a4,112
    80007750:	00998933          	add	s2,s3,s1
    80007754:	38e78a63          	beq	a5,a4,80007ae8 <__printf+0x460>
    80007758:	20f76863          	bltu	a4,a5,80007968 <__printf+0x2e0>
    8000775c:	42a78863          	beq	a5,a0,80007b8c <__printf+0x504>
    80007760:	06400713          	li	a4,100
    80007764:	40e79663          	bne	a5,a4,80007b70 <__printf+0x4e8>
    80007768:	f7843783          	ld	a5,-136(s0)
    8000776c:	0007a603          	lw	a2,0(a5)
    80007770:	00878793          	addi	a5,a5,8
    80007774:	f6f43c23          	sd	a5,-136(s0)
    80007778:	42064a63          	bltz	a2,80007bac <__printf+0x524>
    8000777c:	00a00713          	li	a4,10
    80007780:	02e677bb          	remuw	a5,a2,a4
    80007784:	00002d97          	auipc	s11,0x2
    80007788:	f94d8d93          	addi	s11,s11,-108 # 80009718 <digits>
    8000778c:	00900593          	li	a1,9
    80007790:	0006051b          	sext.w	a0,a2
    80007794:	00000c93          	li	s9,0
    80007798:	02079793          	slli	a5,a5,0x20
    8000779c:	0207d793          	srli	a5,a5,0x20
    800077a0:	00fd87b3          	add	a5,s11,a5
    800077a4:	0007c783          	lbu	a5,0(a5)
    800077a8:	02e656bb          	divuw	a3,a2,a4
    800077ac:	f8f40023          	sb	a5,-128(s0)
    800077b0:	14c5d863          	bge	a1,a2,80007900 <__printf+0x278>
    800077b4:	06300593          	li	a1,99
    800077b8:	00100c93          	li	s9,1
    800077bc:	02e6f7bb          	remuw	a5,a3,a4
    800077c0:	02079793          	slli	a5,a5,0x20
    800077c4:	0207d793          	srli	a5,a5,0x20
    800077c8:	00fd87b3          	add	a5,s11,a5
    800077cc:	0007c783          	lbu	a5,0(a5)
    800077d0:	02e6d73b          	divuw	a4,a3,a4
    800077d4:	f8f400a3          	sb	a5,-127(s0)
    800077d8:	12a5f463          	bgeu	a1,a0,80007900 <__printf+0x278>
    800077dc:	00a00693          	li	a3,10
    800077e0:	00900593          	li	a1,9
    800077e4:	02d777bb          	remuw	a5,a4,a3
    800077e8:	02079793          	slli	a5,a5,0x20
    800077ec:	0207d793          	srli	a5,a5,0x20
    800077f0:	00fd87b3          	add	a5,s11,a5
    800077f4:	0007c503          	lbu	a0,0(a5)
    800077f8:	02d757bb          	divuw	a5,a4,a3
    800077fc:	f8a40123          	sb	a0,-126(s0)
    80007800:	48e5f263          	bgeu	a1,a4,80007c84 <__printf+0x5fc>
    80007804:	06300513          	li	a0,99
    80007808:	02d7f5bb          	remuw	a1,a5,a3
    8000780c:	02059593          	slli	a1,a1,0x20
    80007810:	0205d593          	srli	a1,a1,0x20
    80007814:	00bd85b3          	add	a1,s11,a1
    80007818:	0005c583          	lbu	a1,0(a1)
    8000781c:	02d7d7bb          	divuw	a5,a5,a3
    80007820:	f8b401a3          	sb	a1,-125(s0)
    80007824:	48e57263          	bgeu	a0,a4,80007ca8 <__printf+0x620>
    80007828:	3e700513          	li	a0,999
    8000782c:	02d7f5bb          	remuw	a1,a5,a3
    80007830:	02059593          	slli	a1,a1,0x20
    80007834:	0205d593          	srli	a1,a1,0x20
    80007838:	00bd85b3          	add	a1,s11,a1
    8000783c:	0005c583          	lbu	a1,0(a1)
    80007840:	02d7d7bb          	divuw	a5,a5,a3
    80007844:	f8b40223          	sb	a1,-124(s0)
    80007848:	46e57663          	bgeu	a0,a4,80007cb4 <__printf+0x62c>
    8000784c:	02d7f5bb          	remuw	a1,a5,a3
    80007850:	02059593          	slli	a1,a1,0x20
    80007854:	0205d593          	srli	a1,a1,0x20
    80007858:	00bd85b3          	add	a1,s11,a1
    8000785c:	0005c583          	lbu	a1,0(a1)
    80007860:	02d7d7bb          	divuw	a5,a5,a3
    80007864:	f8b402a3          	sb	a1,-123(s0)
    80007868:	46ea7863          	bgeu	s4,a4,80007cd8 <__printf+0x650>
    8000786c:	02d7f5bb          	remuw	a1,a5,a3
    80007870:	02059593          	slli	a1,a1,0x20
    80007874:	0205d593          	srli	a1,a1,0x20
    80007878:	00bd85b3          	add	a1,s11,a1
    8000787c:	0005c583          	lbu	a1,0(a1)
    80007880:	02d7d7bb          	divuw	a5,a5,a3
    80007884:	f8b40323          	sb	a1,-122(s0)
    80007888:	3eeaf863          	bgeu	s5,a4,80007c78 <__printf+0x5f0>
    8000788c:	02d7f5bb          	remuw	a1,a5,a3
    80007890:	02059593          	slli	a1,a1,0x20
    80007894:	0205d593          	srli	a1,a1,0x20
    80007898:	00bd85b3          	add	a1,s11,a1
    8000789c:	0005c583          	lbu	a1,0(a1)
    800078a0:	02d7d7bb          	divuw	a5,a5,a3
    800078a4:	f8b403a3          	sb	a1,-121(s0)
    800078a8:	42eb7e63          	bgeu	s6,a4,80007ce4 <__printf+0x65c>
    800078ac:	02d7f5bb          	remuw	a1,a5,a3
    800078b0:	02059593          	slli	a1,a1,0x20
    800078b4:	0205d593          	srli	a1,a1,0x20
    800078b8:	00bd85b3          	add	a1,s11,a1
    800078bc:	0005c583          	lbu	a1,0(a1)
    800078c0:	02d7d7bb          	divuw	a5,a5,a3
    800078c4:	f8b40423          	sb	a1,-120(s0)
    800078c8:	42ebfc63          	bgeu	s7,a4,80007d00 <__printf+0x678>
    800078cc:	02079793          	slli	a5,a5,0x20
    800078d0:	0207d793          	srli	a5,a5,0x20
    800078d4:	00fd8db3          	add	s11,s11,a5
    800078d8:	000dc703          	lbu	a4,0(s11)
    800078dc:	00a00793          	li	a5,10
    800078e0:	00900c93          	li	s9,9
    800078e4:	f8e404a3          	sb	a4,-119(s0)
    800078e8:	00065c63          	bgez	a2,80007900 <__printf+0x278>
    800078ec:	f9040713          	addi	a4,s0,-112
    800078f0:	00f70733          	add	a4,a4,a5
    800078f4:	02d00693          	li	a3,45
    800078f8:	fed70823          	sb	a3,-16(a4)
    800078fc:	00078c93          	mv	s9,a5
    80007900:	f8040793          	addi	a5,s0,-128
    80007904:	01978cb3          	add	s9,a5,s9
    80007908:	f7f40d13          	addi	s10,s0,-129
    8000790c:	000cc503          	lbu	a0,0(s9)
    80007910:	fffc8c93          	addi	s9,s9,-1
    80007914:	00000097          	auipc	ra,0x0
    80007918:	b90080e7          	jalr	-1136(ra) # 800074a4 <consputc>
    8000791c:	ffac98e3          	bne	s9,s10,8000790c <__printf+0x284>
    80007920:	00094503          	lbu	a0,0(s2)
    80007924:	e00514e3          	bnez	a0,8000772c <__printf+0xa4>
    80007928:	1a0c1663          	bnez	s8,80007ad4 <__printf+0x44c>
    8000792c:	08813083          	ld	ra,136(sp)
    80007930:	08013403          	ld	s0,128(sp)
    80007934:	07813483          	ld	s1,120(sp)
    80007938:	07013903          	ld	s2,112(sp)
    8000793c:	06813983          	ld	s3,104(sp)
    80007940:	06013a03          	ld	s4,96(sp)
    80007944:	05813a83          	ld	s5,88(sp)
    80007948:	05013b03          	ld	s6,80(sp)
    8000794c:	04813b83          	ld	s7,72(sp)
    80007950:	04013c03          	ld	s8,64(sp)
    80007954:	03813c83          	ld	s9,56(sp)
    80007958:	03013d03          	ld	s10,48(sp)
    8000795c:	02813d83          	ld	s11,40(sp)
    80007960:	0d010113          	addi	sp,sp,208
    80007964:	00008067          	ret
    80007968:	07300713          	li	a4,115
    8000796c:	1ce78a63          	beq	a5,a4,80007b40 <__printf+0x4b8>
    80007970:	07800713          	li	a4,120
    80007974:	1ee79e63          	bne	a5,a4,80007b70 <__printf+0x4e8>
    80007978:	f7843783          	ld	a5,-136(s0)
    8000797c:	0007a703          	lw	a4,0(a5)
    80007980:	00878793          	addi	a5,a5,8
    80007984:	f6f43c23          	sd	a5,-136(s0)
    80007988:	28074263          	bltz	a4,80007c0c <__printf+0x584>
    8000798c:	00002d97          	auipc	s11,0x2
    80007990:	d8cd8d93          	addi	s11,s11,-628 # 80009718 <digits>
    80007994:	00f77793          	andi	a5,a4,15
    80007998:	00fd87b3          	add	a5,s11,a5
    8000799c:	0007c683          	lbu	a3,0(a5)
    800079a0:	00f00613          	li	a2,15
    800079a4:	0007079b          	sext.w	a5,a4
    800079a8:	f8d40023          	sb	a3,-128(s0)
    800079ac:	0047559b          	srliw	a1,a4,0x4
    800079b0:	0047569b          	srliw	a3,a4,0x4
    800079b4:	00000c93          	li	s9,0
    800079b8:	0ee65063          	bge	a2,a4,80007a98 <__printf+0x410>
    800079bc:	00f6f693          	andi	a3,a3,15
    800079c0:	00dd86b3          	add	a3,s11,a3
    800079c4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800079c8:	0087d79b          	srliw	a5,a5,0x8
    800079cc:	00100c93          	li	s9,1
    800079d0:	f8d400a3          	sb	a3,-127(s0)
    800079d4:	0cb67263          	bgeu	a2,a1,80007a98 <__printf+0x410>
    800079d8:	00f7f693          	andi	a3,a5,15
    800079dc:	00dd86b3          	add	a3,s11,a3
    800079e0:	0006c583          	lbu	a1,0(a3)
    800079e4:	00f00613          	li	a2,15
    800079e8:	0047d69b          	srliw	a3,a5,0x4
    800079ec:	f8b40123          	sb	a1,-126(s0)
    800079f0:	0047d593          	srli	a1,a5,0x4
    800079f4:	28f67e63          	bgeu	a2,a5,80007c90 <__printf+0x608>
    800079f8:	00f6f693          	andi	a3,a3,15
    800079fc:	00dd86b3          	add	a3,s11,a3
    80007a00:	0006c503          	lbu	a0,0(a3)
    80007a04:	0087d813          	srli	a6,a5,0x8
    80007a08:	0087d69b          	srliw	a3,a5,0x8
    80007a0c:	f8a401a3          	sb	a0,-125(s0)
    80007a10:	28b67663          	bgeu	a2,a1,80007c9c <__printf+0x614>
    80007a14:	00f6f693          	andi	a3,a3,15
    80007a18:	00dd86b3          	add	a3,s11,a3
    80007a1c:	0006c583          	lbu	a1,0(a3)
    80007a20:	00c7d513          	srli	a0,a5,0xc
    80007a24:	00c7d69b          	srliw	a3,a5,0xc
    80007a28:	f8b40223          	sb	a1,-124(s0)
    80007a2c:	29067a63          	bgeu	a2,a6,80007cc0 <__printf+0x638>
    80007a30:	00f6f693          	andi	a3,a3,15
    80007a34:	00dd86b3          	add	a3,s11,a3
    80007a38:	0006c583          	lbu	a1,0(a3)
    80007a3c:	0107d813          	srli	a6,a5,0x10
    80007a40:	0107d69b          	srliw	a3,a5,0x10
    80007a44:	f8b402a3          	sb	a1,-123(s0)
    80007a48:	28a67263          	bgeu	a2,a0,80007ccc <__printf+0x644>
    80007a4c:	00f6f693          	andi	a3,a3,15
    80007a50:	00dd86b3          	add	a3,s11,a3
    80007a54:	0006c683          	lbu	a3,0(a3)
    80007a58:	0147d79b          	srliw	a5,a5,0x14
    80007a5c:	f8d40323          	sb	a3,-122(s0)
    80007a60:	21067663          	bgeu	a2,a6,80007c6c <__printf+0x5e4>
    80007a64:	02079793          	slli	a5,a5,0x20
    80007a68:	0207d793          	srli	a5,a5,0x20
    80007a6c:	00fd8db3          	add	s11,s11,a5
    80007a70:	000dc683          	lbu	a3,0(s11)
    80007a74:	00800793          	li	a5,8
    80007a78:	00700c93          	li	s9,7
    80007a7c:	f8d403a3          	sb	a3,-121(s0)
    80007a80:	00075c63          	bgez	a4,80007a98 <__printf+0x410>
    80007a84:	f9040713          	addi	a4,s0,-112
    80007a88:	00f70733          	add	a4,a4,a5
    80007a8c:	02d00693          	li	a3,45
    80007a90:	fed70823          	sb	a3,-16(a4)
    80007a94:	00078c93          	mv	s9,a5
    80007a98:	f8040793          	addi	a5,s0,-128
    80007a9c:	01978cb3          	add	s9,a5,s9
    80007aa0:	f7f40d13          	addi	s10,s0,-129
    80007aa4:	000cc503          	lbu	a0,0(s9)
    80007aa8:	fffc8c93          	addi	s9,s9,-1
    80007aac:	00000097          	auipc	ra,0x0
    80007ab0:	9f8080e7          	jalr	-1544(ra) # 800074a4 <consputc>
    80007ab4:	ff9d18e3          	bne	s10,s9,80007aa4 <__printf+0x41c>
    80007ab8:	0100006f          	j	80007ac8 <__printf+0x440>
    80007abc:	00000097          	auipc	ra,0x0
    80007ac0:	9e8080e7          	jalr	-1560(ra) # 800074a4 <consputc>
    80007ac4:	000c8493          	mv	s1,s9
    80007ac8:	00094503          	lbu	a0,0(s2)
    80007acc:	c60510e3          	bnez	a0,8000772c <__printf+0xa4>
    80007ad0:	e40c0ee3          	beqz	s8,8000792c <__printf+0x2a4>
    80007ad4:	00006517          	auipc	a0,0x6
    80007ad8:	86c50513          	addi	a0,a0,-1940 # 8000d340 <pr>
    80007adc:	00001097          	auipc	ra,0x1
    80007ae0:	94c080e7          	jalr	-1716(ra) # 80008428 <release>
    80007ae4:	e49ff06f          	j	8000792c <__printf+0x2a4>
    80007ae8:	f7843783          	ld	a5,-136(s0)
    80007aec:	03000513          	li	a0,48
    80007af0:	01000d13          	li	s10,16
    80007af4:	00878713          	addi	a4,a5,8
    80007af8:	0007bc83          	ld	s9,0(a5)
    80007afc:	f6e43c23          	sd	a4,-136(s0)
    80007b00:	00000097          	auipc	ra,0x0
    80007b04:	9a4080e7          	jalr	-1628(ra) # 800074a4 <consputc>
    80007b08:	07800513          	li	a0,120
    80007b0c:	00000097          	auipc	ra,0x0
    80007b10:	998080e7          	jalr	-1640(ra) # 800074a4 <consputc>
    80007b14:	00002d97          	auipc	s11,0x2
    80007b18:	c04d8d93          	addi	s11,s11,-1020 # 80009718 <digits>
    80007b1c:	03ccd793          	srli	a5,s9,0x3c
    80007b20:	00fd87b3          	add	a5,s11,a5
    80007b24:	0007c503          	lbu	a0,0(a5)
    80007b28:	fffd0d1b          	addiw	s10,s10,-1
    80007b2c:	004c9c93          	slli	s9,s9,0x4
    80007b30:	00000097          	auipc	ra,0x0
    80007b34:	974080e7          	jalr	-1676(ra) # 800074a4 <consputc>
    80007b38:	fe0d12e3          	bnez	s10,80007b1c <__printf+0x494>
    80007b3c:	f8dff06f          	j	80007ac8 <__printf+0x440>
    80007b40:	f7843783          	ld	a5,-136(s0)
    80007b44:	0007bc83          	ld	s9,0(a5)
    80007b48:	00878793          	addi	a5,a5,8
    80007b4c:	f6f43c23          	sd	a5,-136(s0)
    80007b50:	000c9a63          	bnez	s9,80007b64 <__printf+0x4dc>
    80007b54:	1080006f          	j	80007c5c <__printf+0x5d4>
    80007b58:	001c8c93          	addi	s9,s9,1
    80007b5c:	00000097          	auipc	ra,0x0
    80007b60:	948080e7          	jalr	-1720(ra) # 800074a4 <consputc>
    80007b64:	000cc503          	lbu	a0,0(s9)
    80007b68:	fe0518e3          	bnez	a0,80007b58 <__printf+0x4d0>
    80007b6c:	f5dff06f          	j	80007ac8 <__printf+0x440>
    80007b70:	02500513          	li	a0,37
    80007b74:	00000097          	auipc	ra,0x0
    80007b78:	930080e7          	jalr	-1744(ra) # 800074a4 <consputc>
    80007b7c:	000c8513          	mv	a0,s9
    80007b80:	00000097          	auipc	ra,0x0
    80007b84:	924080e7          	jalr	-1756(ra) # 800074a4 <consputc>
    80007b88:	f41ff06f          	j	80007ac8 <__printf+0x440>
    80007b8c:	02500513          	li	a0,37
    80007b90:	00000097          	auipc	ra,0x0
    80007b94:	914080e7          	jalr	-1772(ra) # 800074a4 <consputc>
    80007b98:	f31ff06f          	j	80007ac8 <__printf+0x440>
    80007b9c:	00030513          	mv	a0,t1
    80007ba0:	00000097          	auipc	ra,0x0
    80007ba4:	7bc080e7          	jalr	1980(ra) # 8000835c <acquire>
    80007ba8:	b4dff06f          	j	800076f4 <__printf+0x6c>
    80007bac:	40c0053b          	negw	a0,a2
    80007bb0:	00a00713          	li	a4,10
    80007bb4:	02e576bb          	remuw	a3,a0,a4
    80007bb8:	00002d97          	auipc	s11,0x2
    80007bbc:	b60d8d93          	addi	s11,s11,-1184 # 80009718 <digits>
    80007bc0:	ff700593          	li	a1,-9
    80007bc4:	02069693          	slli	a3,a3,0x20
    80007bc8:	0206d693          	srli	a3,a3,0x20
    80007bcc:	00dd86b3          	add	a3,s11,a3
    80007bd0:	0006c683          	lbu	a3,0(a3)
    80007bd4:	02e557bb          	divuw	a5,a0,a4
    80007bd8:	f8d40023          	sb	a3,-128(s0)
    80007bdc:	10b65e63          	bge	a2,a1,80007cf8 <__printf+0x670>
    80007be0:	06300593          	li	a1,99
    80007be4:	02e7f6bb          	remuw	a3,a5,a4
    80007be8:	02069693          	slli	a3,a3,0x20
    80007bec:	0206d693          	srli	a3,a3,0x20
    80007bf0:	00dd86b3          	add	a3,s11,a3
    80007bf4:	0006c683          	lbu	a3,0(a3)
    80007bf8:	02e7d73b          	divuw	a4,a5,a4
    80007bfc:	00200793          	li	a5,2
    80007c00:	f8d400a3          	sb	a3,-127(s0)
    80007c04:	bca5ece3          	bltu	a1,a0,800077dc <__printf+0x154>
    80007c08:	ce5ff06f          	j	800078ec <__printf+0x264>
    80007c0c:	40e007bb          	negw	a5,a4
    80007c10:	00002d97          	auipc	s11,0x2
    80007c14:	b08d8d93          	addi	s11,s11,-1272 # 80009718 <digits>
    80007c18:	00f7f693          	andi	a3,a5,15
    80007c1c:	00dd86b3          	add	a3,s11,a3
    80007c20:	0006c583          	lbu	a1,0(a3)
    80007c24:	ff100613          	li	a2,-15
    80007c28:	0047d69b          	srliw	a3,a5,0x4
    80007c2c:	f8b40023          	sb	a1,-128(s0)
    80007c30:	0047d59b          	srliw	a1,a5,0x4
    80007c34:	0ac75e63          	bge	a4,a2,80007cf0 <__printf+0x668>
    80007c38:	00f6f693          	andi	a3,a3,15
    80007c3c:	00dd86b3          	add	a3,s11,a3
    80007c40:	0006c603          	lbu	a2,0(a3)
    80007c44:	00f00693          	li	a3,15
    80007c48:	0087d79b          	srliw	a5,a5,0x8
    80007c4c:	f8c400a3          	sb	a2,-127(s0)
    80007c50:	d8b6e4e3          	bltu	a3,a1,800079d8 <__printf+0x350>
    80007c54:	00200793          	li	a5,2
    80007c58:	e2dff06f          	j	80007a84 <__printf+0x3fc>
    80007c5c:	00002c97          	auipc	s9,0x2
    80007c60:	a9cc8c93          	addi	s9,s9,-1380 # 800096f8 <CONSOLE_STATUS+0x6e8>
    80007c64:	02800513          	li	a0,40
    80007c68:	ef1ff06f          	j	80007b58 <__printf+0x4d0>
    80007c6c:	00700793          	li	a5,7
    80007c70:	00600c93          	li	s9,6
    80007c74:	e0dff06f          	j	80007a80 <__printf+0x3f8>
    80007c78:	00700793          	li	a5,7
    80007c7c:	00600c93          	li	s9,6
    80007c80:	c69ff06f          	j	800078e8 <__printf+0x260>
    80007c84:	00300793          	li	a5,3
    80007c88:	00200c93          	li	s9,2
    80007c8c:	c5dff06f          	j	800078e8 <__printf+0x260>
    80007c90:	00300793          	li	a5,3
    80007c94:	00200c93          	li	s9,2
    80007c98:	de9ff06f          	j	80007a80 <__printf+0x3f8>
    80007c9c:	00400793          	li	a5,4
    80007ca0:	00300c93          	li	s9,3
    80007ca4:	dddff06f          	j	80007a80 <__printf+0x3f8>
    80007ca8:	00400793          	li	a5,4
    80007cac:	00300c93          	li	s9,3
    80007cb0:	c39ff06f          	j	800078e8 <__printf+0x260>
    80007cb4:	00500793          	li	a5,5
    80007cb8:	00400c93          	li	s9,4
    80007cbc:	c2dff06f          	j	800078e8 <__printf+0x260>
    80007cc0:	00500793          	li	a5,5
    80007cc4:	00400c93          	li	s9,4
    80007cc8:	db9ff06f          	j	80007a80 <__printf+0x3f8>
    80007ccc:	00600793          	li	a5,6
    80007cd0:	00500c93          	li	s9,5
    80007cd4:	dadff06f          	j	80007a80 <__printf+0x3f8>
    80007cd8:	00600793          	li	a5,6
    80007cdc:	00500c93          	li	s9,5
    80007ce0:	c09ff06f          	j	800078e8 <__printf+0x260>
    80007ce4:	00800793          	li	a5,8
    80007ce8:	00700c93          	li	s9,7
    80007cec:	bfdff06f          	j	800078e8 <__printf+0x260>
    80007cf0:	00100793          	li	a5,1
    80007cf4:	d91ff06f          	j	80007a84 <__printf+0x3fc>
    80007cf8:	00100793          	li	a5,1
    80007cfc:	bf1ff06f          	j	800078ec <__printf+0x264>
    80007d00:	00900793          	li	a5,9
    80007d04:	00800c93          	li	s9,8
    80007d08:	be1ff06f          	j	800078e8 <__printf+0x260>
    80007d0c:	00002517          	auipc	a0,0x2
    80007d10:	9f450513          	addi	a0,a0,-1548 # 80009700 <CONSOLE_STATUS+0x6f0>
    80007d14:	00000097          	auipc	ra,0x0
    80007d18:	918080e7          	jalr	-1768(ra) # 8000762c <panic>

0000000080007d1c <printfinit>:
    80007d1c:	fe010113          	addi	sp,sp,-32
    80007d20:	00813823          	sd	s0,16(sp)
    80007d24:	00913423          	sd	s1,8(sp)
    80007d28:	00113c23          	sd	ra,24(sp)
    80007d2c:	02010413          	addi	s0,sp,32
    80007d30:	00005497          	auipc	s1,0x5
    80007d34:	61048493          	addi	s1,s1,1552 # 8000d340 <pr>
    80007d38:	00048513          	mv	a0,s1
    80007d3c:	00002597          	auipc	a1,0x2
    80007d40:	9d458593          	addi	a1,a1,-1580 # 80009710 <CONSOLE_STATUS+0x700>
    80007d44:	00000097          	auipc	ra,0x0
    80007d48:	5f4080e7          	jalr	1524(ra) # 80008338 <initlock>
    80007d4c:	01813083          	ld	ra,24(sp)
    80007d50:	01013403          	ld	s0,16(sp)
    80007d54:	0004ac23          	sw	zero,24(s1)
    80007d58:	00813483          	ld	s1,8(sp)
    80007d5c:	02010113          	addi	sp,sp,32
    80007d60:	00008067          	ret

0000000080007d64 <uartinit>:
    80007d64:	ff010113          	addi	sp,sp,-16
    80007d68:	00813423          	sd	s0,8(sp)
    80007d6c:	01010413          	addi	s0,sp,16
    80007d70:	100007b7          	lui	a5,0x10000
    80007d74:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007d78:	f8000713          	li	a4,-128
    80007d7c:	00e781a3          	sb	a4,3(a5)
    80007d80:	00300713          	li	a4,3
    80007d84:	00e78023          	sb	a4,0(a5)
    80007d88:	000780a3          	sb	zero,1(a5)
    80007d8c:	00e781a3          	sb	a4,3(a5)
    80007d90:	00700693          	li	a3,7
    80007d94:	00d78123          	sb	a3,2(a5)
    80007d98:	00e780a3          	sb	a4,1(a5)
    80007d9c:	00813403          	ld	s0,8(sp)
    80007da0:	01010113          	addi	sp,sp,16
    80007da4:	00008067          	ret

0000000080007da8 <uartputc>:
    80007da8:	00004797          	auipc	a5,0x4
    80007dac:	a807a783          	lw	a5,-1408(a5) # 8000b828 <panicked>
    80007db0:	00078463          	beqz	a5,80007db8 <uartputc+0x10>
    80007db4:	0000006f          	j	80007db4 <uartputc+0xc>
    80007db8:	fd010113          	addi	sp,sp,-48
    80007dbc:	02813023          	sd	s0,32(sp)
    80007dc0:	00913c23          	sd	s1,24(sp)
    80007dc4:	01213823          	sd	s2,16(sp)
    80007dc8:	01313423          	sd	s3,8(sp)
    80007dcc:	02113423          	sd	ra,40(sp)
    80007dd0:	03010413          	addi	s0,sp,48
    80007dd4:	00004917          	auipc	s2,0x4
    80007dd8:	a5c90913          	addi	s2,s2,-1444 # 8000b830 <uart_tx_r>
    80007ddc:	00093783          	ld	a5,0(s2)
    80007de0:	00004497          	auipc	s1,0x4
    80007de4:	a5848493          	addi	s1,s1,-1448 # 8000b838 <uart_tx_w>
    80007de8:	0004b703          	ld	a4,0(s1)
    80007dec:	02078693          	addi	a3,a5,32
    80007df0:	00050993          	mv	s3,a0
    80007df4:	02e69c63          	bne	a3,a4,80007e2c <uartputc+0x84>
    80007df8:	00001097          	auipc	ra,0x1
    80007dfc:	834080e7          	jalr	-1996(ra) # 8000862c <push_on>
    80007e00:	00093783          	ld	a5,0(s2)
    80007e04:	0004b703          	ld	a4,0(s1)
    80007e08:	02078793          	addi	a5,a5,32
    80007e0c:	00e79463          	bne	a5,a4,80007e14 <uartputc+0x6c>
    80007e10:	0000006f          	j	80007e10 <uartputc+0x68>
    80007e14:	00001097          	auipc	ra,0x1
    80007e18:	88c080e7          	jalr	-1908(ra) # 800086a0 <pop_on>
    80007e1c:	00093783          	ld	a5,0(s2)
    80007e20:	0004b703          	ld	a4,0(s1)
    80007e24:	02078693          	addi	a3,a5,32
    80007e28:	fce688e3          	beq	a3,a4,80007df8 <uartputc+0x50>
    80007e2c:	01f77693          	andi	a3,a4,31
    80007e30:	00005597          	auipc	a1,0x5
    80007e34:	53058593          	addi	a1,a1,1328 # 8000d360 <uart_tx_buf>
    80007e38:	00d586b3          	add	a3,a1,a3
    80007e3c:	00170713          	addi	a4,a4,1
    80007e40:	01368023          	sb	s3,0(a3)
    80007e44:	00e4b023          	sd	a4,0(s1)
    80007e48:	10000637          	lui	a2,0x10000
    80007e4c:	02f71063          	bne	a4,a5,80007e6c <uartputc+0xc4>
    80007e50:	0340006f          	j	80007e84 <uartputc+0xdc>
    80007e54:	00074703          	lbu	a4,0(a4)
    80007e58:	00f93023          	sd	a5,0(s2)
    80007e5c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007e60:	00093783          	ld	a5,0(s2)
    80007e64:	0004b703          	ld	a4,0(s1)
    80007e68:	00f70e63          	beq	a4,a5,80007e84 <uartputc+0xdc>
    80007e6c:	00564683          	lbu	a3,5(a2)
    80007e70:	01f7f713          	andi	a4,a5,31
    80007e74:	00e58733          	add	a4,a1,a4
    80007e78:	0206f693          	andi	a3,a3,32
    80007e7c:	00178793          	addi	a5,a5,1
    80007e80:	fc069ae3          	bnez	a3,80007e54 <uartputc+0xac>
    80007e84:	02813083          	ld	ra,40(sp)
    80007e88:	02013403          	ld	s0,32(sp)
    80007e8c:	01813483          	ld	s1,24(sp)
    80007e90:	01013903          	ld	s2,16(sp)
    80007e94:	00813983          	ld	s3,8(sp)
    80007e98:	03010113          	addi	sp,sp,48
    80007e9c:	00008067          	ret

0000000080007ea0 <uartputc_sync>:
    80007ea0:	ff010113          	addi	sp,sp,-16
    80007ea4:	00813423          	sd	s0,8(sp)
    80007ea8:	01010413          	addi	s0,sp,16
    80007eac:	00004717          	auipc	a4,0x4
    80007eb0:	97c72703          	lw	a4,-1668(a4) # 8000b828 <panicked>
    80007eb4:	02071663          	bnez	a4,80007ee0 <uartputc_sync+0x40>
    80007eb8:	00050793          	mv	a5,a0
    80007ebc:	100006b7          	lui	a3,0x10000
    80007ec0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80007ec4:	02077713          	andi	a4,a4,32
    80007ec8:	fe070ce3          	beqz	a4,80007ec0 <uartputc_sync+0x20>
    80007ecc:	0ff7f793          	andi	a5,a5,255
    80007ed0:	00f68023          	sb	a5,0(a3)
    80007ed4:	00813403          	ld	s0,8(sp)
    80007ed8:	01010113          	addi	sp,sp,16
    80007edc:	00008067          	ret
    80007ee0:	0000006f          	j	80007ee0 <uartputc_sync+0x40>

0000000080007ee4 <uartstart>:
    80007ee4:	ff010113          	addi	sp,sp,-16
    80007ee8:	00813423          	sd	s0,8(sp)
    80007eec:	01010413          	addi	s0,sp,16
    80007ef0:	00004617          	auipc	a2,0x4
    80007ef4:	94060613          	addi	a2,a2,-1728 # 8000b830 <uart_tx_r>
    80007ef8:	00004517          	auipc	a0,0x4
    80007efc:	94050513          	addi	a0,a0,-1728 # 8000b838 <uart_tx_w>
    80007f00:	00063783          	ld	a5,0(a2)
    80007f04:	00053703          	ld	a4,0(a0)
    80007f08:	04f70263          	beq	a4,a5,80007f4c <uartstart+0x68>
    80007f0c:	100005b7          	lui	a1,0x10000
    80007f10:	00005817          	auipc	a6,0x5
    80007f14:	45080813          	addi	a6,a6,1104 # 8000d360 <uart_tx_buf>
    80007f18:	01c0006f          	j	80007f34 <uartstart+0x50>
    80007f1c:	0006c703          	lbu	a4,0(a3)
    80007f20:	00f63023          	sd	a5,0(a2)
    80007f24:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007f28:	00063783          	ld	a5,0(a2)
    80007f2c:	00053703          	ld	a4,0(a0)
    80007f30:	00f70e63          	beq	a4,a5,80007f4c <uartstart+0x68>
    80007f34:	01f7f713          	andi	a4,a5,31
    80007f38:	00e806b3          	add	a3,a6,a4
    80007f3c:	0055c703          	lbu	a4,5(a1)
    80007f40:	00178793          	addi	a5,a5,1
    80007f44:	02077713          	andi	a4,a4,32
    80007f48:	fc071ae3          	bnez	a4,80007f1c <uartstart+0x38>
    80007f4c:	00813403          	ld	s0,8(sp)
    80007f50:	01010113          	addi	sp,sp,16
    80007f54:	00008067          	ret

0000000080007f58 <uartgetc>:
    80007f58:	ff010113          	addi	sp,sp,-16
    80007f5c:	00813423          	sd	s0,8(sp)
    80007f60:	01010413          	addi	s0,sp,16
    80007f64:	10000737          	lui	a4,0x10000
    80007f68:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80007f6c:	0017f793          	andi	a5,a5,1
    80007f70:	00078c63          	beqz	a5,80007f88 <uartgetc+0x30>
    80007f74:	00074503          	lbu	a0,0(a4)
    80007f78:	0ff57513          	andi	a0,a0,255
    80007f7c:	00813403          	ld	s0,8(sp)
    80007f80:	01010113          	addi	sp,sp,16
    80007f84:	00008067          	ret
    80007f88:	fff00513          	li	a0,-1
    80007f8c:	ff1ff06f          	j	80007f7c <uartgetc+0x24>

0000000080007f90 <uartintr>:
    80007f90:	100007b7          	lui	a5,0x10000
    80007f94:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80007f98:	0017f793          	andi	a5,a5,1
    80007f9c:	0a078463          	beqz	a5,80008044 <uartintr+0xb4>
    80007fa0:	fe010113          	addi	sp,sp,-32
    80007fa4:	00813823          	sd	s0,16(sp)
    80007fa8:	00913423          	sd	s1,8(sp)
    80007fac:	00113c23          	sd	ra,24(sp)
    80007fb0:	02010413          	addi	s0,sp,32
    80007fb4:	100004b7          	lui	s1,0x10000
    80007fb8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80007fbc:	0ff57513          	andi	a0,a0,255
    80007fc0:	fffff097          	auipc	ra,0xfffff
    80007fc4:	534080e7          	jalr	1332(ra) # 800074f4 <consoleintr>
    80007fc8:	0054c783          	lbu	a5,5(s1)
    80007fcc:	0017f793          	andi	a5,a5,1
    80007fd0:	fe0794e3          	bnez	a5,80007fb8 <uartintr+0x28>
    80007fd4:	00004617          	auipc	a2,0x4
    80007fd8:	85c60613          	addi	a2,a2,-1956 # 8000b830 <uart_tx_r>
    80007fdc:	00004517          	auipc	a0,0x4
    80007fe0:	85c50513          	addi	a0,a0,-1956 # 8000b838 <uart_tx_w>
    80007fe4:	00063783          	ld	a5,0(a2)
    80007fe8:	00053703          	ld	a4,0(a0)
    80007fec:	04f70263          	beq	a4,a5,80008030 <uartintr+0xa0>
    80007ff0:	100005b7          	lui	a1,0x10000
    80007ff4:	00005817          	auipc	a6,0x5
    80007ff8:	36c80813          	addi	a6,a6,876 # 8000d360 <uart_tx_buf>
    80007ffc:	01c0006f          	j	80008018 <uartintr+0x88>
    80008000:	0006c703          	lbu	a4,0(a3)
    80008004:	00f63023          	sd	a5,0(a2)
    80008008:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000800c:	00063783          	ld	a5,0(a2)
    80008010:	00053703          	ld	a4,0(a0)
    80008014:	00f70e63          	beq	a4,a5,80008030 <uartintr+0xa0>
    80008018:	01f7f713          	andi	a4,a5,31
    8000801c:	00e806b3          	add	a3,a6,a4
    80008020:	0055c703          	lbu	a4,5(a1)
    80008024:	00178793          	addi	a5,a5,1
    80008028:	02077713          	andi	a4,a4,32
    8000802c:	fc071ae3          	bnez	a4,80008000 <uartintr+0x70>
    80008030:	01813083          	ld	ra,24(sp)
    80008034:	01013403          	ld	s0,16(sp)
    80008038:	00813483          	ld	s1,8(sp)
    8000803c:	02010113          	addi	sp,sp,32
    80008040:	00008067          	ret
    80008044:	00003617          	auipc	a2,0x3
    80008048:	7ec60613          	addi	a2,a2,2028 # 8000b830 <uart_tx_r>
    8000804c:	00003517          	auipc	a0,0x3
    80008050:	7ec50513          	addi	a0,a0,2028 # 8000b838 <uart_tx_w>
    80008054:	00063783          	ld	a5,0(a2)
    80008058:	00053703          	ld	a4,0(a0)
    8000805c:	04f70263          	beq	a4,a5,800080a0 <uartintr+0x110>
    80008060:	100005b7          	lui	a1,0x10000
    80008064:	00005817          	auipc	a6,0x5
    80008068:	2fc80813          	addi	a6,a6,764 # 8000d360 <uart_tx_buf>
    8000806c:	01c0006f          	j	80008088 <uartintr+0xf8>
    80008070:	0006c703          	lbu	a4,0(a3)
    80008074:	00f63023          	sd	a5,0(a2)
    80008078:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000807c:	00063783          	ld	a5,0(a2)
    80008080:	00053703          	ld	a4,0(a0)
    80008084:	02f70063          	beq	a4,a5,800080a4 <uartintr+0x114>
    80008088:	01f7f713          	andi	a4,a5,31
    8000808c:	00e806b3          	add	a3,a6,a4
    80008090:	0055c703          	lbu	a4,5(a1)
    80008094:	00178793          	addi	a5,a5,1
    80008098:	02077713          	andi	a4,a4,32
    8000809c:	fc071ae3          	bnez	a4,80008070 <uartintr+0xe0>
    800080a0:	00008067          	ret
    800080a4:	00008067          	ret

00000000800080a8 <kinit>:
    800080a8:	fc010113          	addi	sp,sp,-64
    800080ac:	02913423          	sd	s1,40(sp)
    800080b0:	fffff7b7          	lui	a5,0xfffff
    800080b4:	00006497          	auipc	s1,0x6
    800080b8:	2cb48493          	addi	s1,s1,715 # 8000e37f <end+0xfff>
    800080bc:	02813823          	sd	s0,48(sp)
    800080c0:	01313c23          	sd	s3,24(sp)
    800080c4:	00f4f4b3          	and	s1,s1,a5
    800080c8:	02113c23          	sd	ra,56(sp)
    800080cc:	03213023          	sd	s2,32(sp)
    800080d0:	01413823          	sd	s4,16(sp)
    800080d4:	01513423          	sd	s5,8(sp)
    800080d8:	04010413          	addi	s0,sp,64
    800080dc:	000017b7          	lui	a5,0x1
    800080e0:	01100993          	li	s3,17
    800080e4:	00f487b3          	add	a5,s1,a5
    800080e8:	01b99993          	slli	s3,s3,0x1b
    800080ec:	06f9e063          	bltu	s3,a5,8000814c <kinit+0xa4>
    800080f0:	00005a97          	auipc	s5,0x5
    800080f4:	290a8a93          	addi	s5,s5,656 # 8000d380 <end>
    800080f8:	0754ec63          	bltu	s1,s5,80008170 <kinit+0xc8>
    800080fc:	0734fa63          	bgeu	s1,s3,80008170 <kinit+0xc8>
    80008100:	00088a37          	lui	s4,0x88
    80008104:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008108:	00003917          	auipc	s2,0x3
    8000810c:	73890913          	addi	s2,s2,1848 # 8000b840 <kmem>
    80008110:	00ca1a13          	slli	s4,s4,0xc
    80008114:	0140006f          	j	80008128 <kinit+0x80>
    80008118:	000017b7          	lui	a5,0x1
    8000811c:	00f484b3          	add	s1,s1,a5
    80008120:	0554e863          	bltu	s1,s5,80008170 <kinit+0xc8>
    80008124:	0534f663          	bgeu	s1,s3,80008170 <kinit+0xc8>
    80008128:	00001637          	lui	a2,0x1
    8000812c:	00100593          	li	a1,1
    80008130:	00048513          	mv	a0,s1
    80008134:	00000097          	auipc	ra,0x0
    80008138:	5e4080e7          	jalr	1508(ra) # 80008718 <__memset>
    8000813c:	00093783          	ld	a5,0(s2)
    80008140:	00f4b023          	sd	a5,0(s1)
    80008144:	00993023          	sd	s1,0(s2)
    80008148:	fd4498e3          	bne	s1,s4,80008118 <kinit+0x70>
    8000814c:	03813083          	ld	ra,56(sp)
    80008150:	03013403          	ld	s0,48(sp)
    80008154:	02813483          	ld	s1,40(sp)
    80008158:	02013903          	ld	s2,32(sp)
    8000815c:	01813983          	ld	s3,24(sp)
    80008160:	01013a03          	ld	s4,16(sp)
    80008164:	00813a83          	ld	s5,8(sp)
    80008168:	04010113          	addi	sp,sp,64
    8000816c:	00008067          	ret
    80008170:	00001517          	auipc	a0,0x1
    80008174:	5c050513          	addi	a0,a0,1472 # 80009730 <digits+0x18>
    80008178:	fffff097          	auipc	ra,0xfffff
    8000817c:	4b4080e7          	jalr	1204(ra) # 8000762c <panic>

0000000080008180 <freerange>:
    80008180:	fc010113          	addi	sp,sp,-64
    80008184:	000017b7          	lui	a5,0x1
    80008188:	02913423          	sd	s1,40(sp)
    8000818c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008190:	009504b3          	add	s1,a0,s1
    80008194:	fffff537          	lui	a0,0xfffff
    80008198:	02813823          	sd	s0,48(sp)
    8000819c:	02113c23          	sd	ra,56(sp)
    800081a0:	03213023          	sd	s2,32(sp)
    800081a4:	01313c23          	sd	s3,24(sp)
    800081a8:	01413823          	sd	s4,16(sp)
    800081ac:	01513423          	sd	s5,8(sp)
    800081b0:	01613023          	sd	s6,0(sp)
    800081b4:	04010413          	addi	s0,sp,64
    800081b8:	00a4f4b3          	and	s1,s1,a0
    800081bc:	00f487b3          	add	a5,s1,a5
    800081c0:	06f5e463          	bltu	a1,a5,80008228 <freerange+0xa8>
    800081c4:	00005a97          	auipc	s5,0x5
    800081c8:	1bca8a93          	addi	s5,s5,444 # 8000d380 <end>
    800081cc:	0954e263          	bltu	s1,s5,80008250 <freerange+0xd0>
    800081d0:	01100993          	li	s3,17
    800081d4:	01b99993          	slli	s3,s3,0x1b
    800081d8:	0734fc63          	bgeu	s1,s3,80008250 <freerange+0xd0>
    800081dc:	00058a13          	mv	s4,a1
    800081e0:	00003917          	auipc	s2,0x3
    800081e4:	66090913          	addi	s2,s2,1632 # 8000b840 <kmem>
    800081e8:	00002b37          	lui	s6,0x2
    800081ec:	0140006f          	j	80008200 <freerange+0x80>
    800081f0:	000017b7          	lui	a5,0x1
    800081f4:	00f484b3          	add	s1,s1,a5
    800081f8:	0554ec63          	bltu	s1,s5,80008250 <freerange+0xd0>
    800081fc:	0534fa63          	bgeu	s1,s3,80008250 <freerange+0xd0>
    80008200:	00001637          	lui	a2,0x1
    80008204:	00100593          	li	a1,1
    80008208:	00048513          	mv	a0,s1
    8000820c:	00000097          	auipc	ra,0x0
    80008210:	50c080e7          	jalr	1292(ra) # 80008718 <__memset>
    80008214:	00093703          	ld	a4,0(s2)
    80008218:	016487b3          	add	a5,s1,s6
    8000821c:	00e4b023          	sd	a4,0(s1)
    80008220:	00993023          	sd	s1,0(s2)
    80008224:	fcfa76e3          	bgeu	s4,a5,800081f0 <freerange+0x70>
    80008228:	03813083          	ld	ra,56(sp)
    8000822c:	03013403          	ld	s0,48(sp)
    80008230:	02813483          	ld	s1,40(sp)
    80008234:	02013903          	ld	s2,32(sp)
    80008238:	01813983          	ld	s3,24(sp)
    8000823c:	01013a03          	ld	s4,16(sp)
    80008240:	00813a83          	ld	s5,8(sp)
    80008244:	00013b03          	ld	s6,0(sp)
    80008248:	04010113          	addi	sp,sp,64
    8000824c:	00008067          	ret
    80008250:	00001517          	auipc	a0,0x1
    80008254:	4e050513          	addi	a0,a0,1248 # 80009730 <digits+0x18>
    80008258:	fffff097          	auipc	ra,0xfffff
    8000825c:	3d4080e7          	jalr	980(ra) # 8000762c <panic>

0000000080008260 <kfree>:
    80008260:	fe010113          	addi	sp,sp,-32
    80008264:	00813823          	sd	s0,16(sp)
    80008268:	00113c23          	sd	ra,24(sp)
    8000826c:	00913423          	sd	s1,8(sp)
    80008270:	02010413          	addi	s0,sp,32
    80008274:	03451793          	slli	a5,a0,0x34
    80008278:	04079c63          	bnez	a5,800082d0 <kfree+0x70>
    8000827c:	00005797          	auipc	a5,0x5
    80008280:	10478793          	addi	a5,a5,260 # 8000d380 <end>
    80008284:	00050493          	mv	s1,a0
    80008288:	04f56463          	bltu	a0,a5,800082d0 <kfree+0x70>
    8000828c:	01100793          	li	a5,17
    80008290:	01b79793          	slli	a5,a5,0x1b
    80008294:	02f57e63          	bgeu	a0,a5,800082d0 <kfree+0x70>
    80008298:	00001637          	lui	a2,0x1
    8000829c:	00100593          	li	a1,1
    800082a0:	00000097          	auipc	ra,0x0
    800082a4:	478080e7          	jalr	1144(ra) # 80008718 <__memset>
    800082a8:	00003797          	auipc	a5,0x3
    800082ac:	59878793          	addi	a5,a5,1432 # 8000b840 <kmem>
    800082b0:	0007b703          	ld	a4,0(a5)
    800082b4:	01813083          	ld	ra,24(sp)
    800082b8:	01013403          	ld	s0,16(sp)
    800082bc:	00e4b023          	sd	a4,0(s1)
    800082c0:	0097b023          	sd	s1,0(a5)
    800082c4:	00813483          	ld	s1,8(sp)
    800082c8:	02010113          	addi	sp,sp,32
    800082cc:	00008067          	ret
    800082d0:	00001517          	auipc	a0,0x1
    800082d4:	46050513          	addi	a0,a0,1120 # 80009730 <digits+0x18>
    800082d8:	fffff097          	auipc	ra,0xfffff
    800082dc:	354080e7          	jalr	852(ra) # 8000762c <panic>

00000000800082e0 <kalloc>:
    800082e0:	fe010113          	addi	sp,sp,-32
    800082e4:	00813823          	sd	s0,16(sp)
    800082e8:	00913423          	sd	s1,8(sp)
    800082ec:	00113c23          	sd	ra,24(sp)
    800082f0:	02010413          	addi	s0,sp,32
    800082f4:	00003797          	auipc	a5,0x3
    800082f8:	54c78793          	addi	a5,a5,1356 # 8000b840 <kmem>
    800082fc:	0007b483          	ld	s1,0(a5)
    80008300:	02048063          	beqz	s1,80008320 <kalloc+0x40>
    80008304:	0004b703          	ld	a4,0(s1)
    80008308:	00001637          	lui	a2,0x1
    8000830c:	00500593          	li	a1,5
    80008310:	00048513          	mv	a0,s1
    80008314:	00e7b023          	sd	a4,0(a5)
    80008318:	00000097          	auipc	ra,0x0
    8000831c:	400080e7          	jalr	1024(ra) # 80008718 <__memset>
    80008320:	01813083          	ld	ra,24(sp)
    80008324:	01013403          	ld	s0,16(sp)
    80008328:	00048513          	mv	a0,s1
    8000832c:	00813483          	ld	s1,8(sp)
    80008330:	02010113          	addi	sp,sp,32
    80008334:	00008067          	ret

0000000080008338 <initlock>:
    80008338:	ff010113          	addi	sp,sp,-16
    8000833c:	00813423          	sd	s0,8(sp)
    80008340:	01010413          	addi	s0,sp,16
    80008344:	00813403          	ld	s0,8(sp)
    80008348:	00b53423          	sd	a1,8(a0)
    8000834c:	00052023          	sw	zero,0(a0)
    80008350:	00053823          	sd	zero,16(a0)
    80008354:	01010113          	addi	sp,sp,16
    80008358:	00008067          	ret

000000008000835c <acquire>:
    8000835c:	fe010113          	addi	sp,sp,-32
    80008360:	00813823          	sd	s0,16(sp)
    80008364:	00913423          	sd	s1,8(sp)
    80008368:	00113c23          	sd	ra,24(sp)
    8000836c:	01213023          	sd	s2,0(sp)
    80008370:	02010413          	addi	s0,sp,32
    80008374:	00050493          	mv	s1,a0
    80008378:	10002973          	csrr	s2,sstatus
    8000837c:	100027f3          	csrr	a5,sstatus
    80008380:	ffd7f793          	andi	a5,a5,-3
    80008384:	10079073          	csrw	sstatus,a5
    80008388:	fffff097          	auipc	ra,0xfffff
    8000838c:	8e4080e7          	jalr	-1820(ra) # 80006c6c <mycpu>
    80008390:	07852783          	lw	a5,120(a0)
    80008394:	06078e63          	beqz	a5,80008410 <acquire+0xb4>
    80008398:	fffff097          	auipc	ra,0xfffff
    8000839c:	8d4080e7          	jalr	-1836(ra) # 80006c6c <mycpu>
    800083a0:	07852783          	lw	a5,120(a0)
    800083a4:	0004a703          	lw	a4,0(s1)
    800083a8:	0017879b          	addiw	a5,a5,1
    800083ac:	06f52c23          	sw	a5,120(a0)
    800083b0:	04071063          	bnez	a4,800083f0 <acquire+0x94>
    800083b4:	00100713          	li	a4,1
    800083b8:	00070793          	mv	a5,a4
    800083bc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800083c0:	0007879b          	sext.w	a5,a5
    800083c4:	fe079ae3          	bnez	a5,800083b8 <acquire+0x5c>
    800083c8:	0ff0000f          	fence
    800083cc:	fffff097          	auipc	ra,0xfffff
    800083d0:	8a0080e7          	jalr	-1888(ra) # 80006c6c <mycpu>
    800083d4:	01813083          	ld	ra,24(sp)
    800083d8:	01013403          	ld	s0,16(sp)
    800083dc:	00a4b823          	sd	a0,16(s1)
    800083e0:	00013903          	ld	s2,0(sp)
    800083e4:	00813483          	ld	s1,8(sp)
    800083e8:	02010113          	addi	sp,sp,32
    800083ec:	00008067          	ret
    800083f0:	0104b903          	ld	s2,16(s1)
    800083f4:	fffff097          	auipc	ra,0xfffff
    800083f8:	878080e7          	jalr	-1928(ra) # 80006c6c <mycpu>
    800083fc:	faa91ce3          	bne	s2,a0,800083b4 <acquire+0x58>
    80008400:	00001517          	auipc	a0,0x1
    80008404:	33850513          	addi	a0,a0,824 # 80009738 <digits+0x20>
    80008408:	fffff097          	auipc	ra,0xfffff
    8000840c:	224080e7          	jalr	548(ra) # 8000762c <panic>
    80008410:	00195913          	srli	s2,s2,0x1
    80008414:	fffff097          	auipc	ra,0xfffff
    80008418:	858080e7          	jalr	-1960(ra) # 80006c6c <mycpu>
    8000841c:	00197913          	andi	s2,s2,1
    80008420:	07252e23          	sw	s2,124(a0)
    80008424:	f75ff06f          	j	80008398 <acquire+0x3c>

0000000080008428 <release>:
    80008428:	fe010113          	addi	sp,sp,-32
    8000842c:	00813823          	sd	s0,16(sp)
    80008430:	00113c23          	sd	ra,24(sp)
    80008434:	00913423          	sd	s1,8(sp)
    80008438:	01213023          	sd	s2,0(sp)
    8000843c:	02010413          	addi	s0,sp,32
    80008440:	00052783          	lw	a5,0(a0)
    80008444:	00079a63          	bnez	a5,80008458 <release+0x30>
    80008448:	00001517          	auipc	a0,0x1
    8000844c:	2f850513          	addi	a0,a0,760 # 80009740 <digits+0x28>
    80008450:	fffff097          	auipc	ra,0xfffff
    80008454:	1dc080e7          	jalr	476(ra) # 8000762c <panic>
    80008458:	01053903          	ld	s2,16(a0)
    8000845c:	00050493          	mv	s1,a0
    80008460:	fffff097          	auipc	ra,0xfffff
    80008464:	80c080e7          	jalr	-2036(ra) # 80006c6c <mycpu>
    80008468:	fea910e3          	bne	s2,a0,80008448 <release+0x20>
    8000846c:	0004b823          	sd	zero,16(s1)
    80008470:	0ff0000f          	fence
    80008474:	0f50000f          	fence	iorw,ow
    80008478:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000847c:	ffffe097          	auipc	ra,0xffffe
    80008480:	7f0080e7          	jalr	2032(ra) # 80006c6c <mycpu>
    80008484:	100027f3          	csrr	a5,sstatus
    80008488:	0027f793          	andi	a5,a5,2
    8000848c:	04079a63          	bnez	a5,800084e0 <release+0xb8>
    80008490:	07852783          	lw	a5,120(a0)
    80008494:	02f05e63          	blez	a5,800084d0 <release+0xa8>
    80008498:	fff7871b          	addiw	a4,a5,-1
    8000849c:	06e52c23          	sw	a4,120(a0)
    800084a0:	00071c63          	bnez	a4,800084b8 <release+0x90>
    800084a4:	07c52783          	lw	a5,124(a0)
    800084a8:	00078863          	beqz	a5,800084b8 <release+0x90>
    800084ac:	100027f3          	csrr	a5,sstatus
    800084b0:	0027e793          	ori	a5,a5,2
    800084b4:	10079073          	csrw	sstatus,a5
    800084b8:	01813083          	ld	ra,24(sp)
    800084bc:	01013403          	ld	s0,16(sp)
    800084c0:	00813483          	ld	s1,8(sp)
    800084c4:	00013903          	ld	s2,0(sp)
    800084c8:	02010113          	addi	sp,sp,32
    800084cc:	00008067          	ret
    800084d0:	00001517          	auipc	a0,0x1
    800084d4:	29050513          	addi	a0,a0,656 # 80009760 <digits+0x48>
    800084d8:	fffff097          	auipc	ra,0xfffff
    800084dc:	154080e7          	jalr	340(ra) # 8000762c <panic>
    800084e0:	00001517          	auipc	a0,0x1
    800084e4:	26850513          	addi	a0,a0,616 # 80009748 <digits+0x30>
    800084e8:	fffff097          	auipc	ra,0xfffff
    800084ec:	144080e7          	jalr	324(ra) # 8000762c <panic>

00000000800084f0 <holding>:
    800084f0:	00052783          	lw	a5,0(a0)
    800084f4:	00079663          	bnez	a5,80008500 <holding+0x10>
    800084f8:	00000513          	li	a0,0
    800084fc:	00008067          	ret
    80008500:	fe010113          	addi	sp,sp,-32
    80008504:	00813823          	sd	s0,16(sp)
    80008508:	00913423          	sd	s1,8(sp)
    8000850c:	00113c23          	sd	ra,24(sp)
    80008510:	02010413          	addi	s0,sp,32
    80008514:	01053483          	ld	s1,16(a0)
    80008518:	ffffe097          	auipc	ra,0xffffe
    8000851c:	754080e7          	jalr	1876(ra) # 80006c6c <mycpu>
    80008520:	01813083          	ld	ra,24(sp)
    80008524:	01013403          	ld	s0,16(sp)
    80008528:	40a48533          	sub	a0,s1,a0
    8000852c:	00153513          	seqz	a0,a0
    80008530:	00813483          	ld	s1,8(sp)
    80008534:	02010113          	addi	sp,sp,32
    80008538:	00008067          	ret

000000008000853c <push_off>:
    8000853c:	fe010113          	addi	sp,sp,-32
    80008540:	00813823          	sd	s0,16(sp)
    80008544:	00113c23          	sd	ra,24(sp)
    80008548:	00913423          	sd	s1,8(sp)
    8000854c:	02010413          	addi	s0,sp,32
    80008550:	100024f3          	csrr	s1,sstatus
    80008554:	100027f3          	csrr	a5,sstatus
    80008558:	ffd7f793          	andi	a5,a5,-3
    8000855c:	10079073          	csrw	sstatus,a5
    80008560:	ffffe097          	auipc	ra,0xffffe
    80008564:	70c080e7          	jalr	1804(ra) # 80006c6c <mycpu>
    80008568:	07852783          	lw	a5,120(a0)
    8000856c:	02078663          	beqz	a5,80008598 <push_off+0x5c>
    80008570:	ffffe097          	auipc	ra,0xffffe
    80008574:	6fc080e7          	jalr	1788(ra) # 80006c6c <mycpu>
    80008578:	07852783          	lw	a5,120(a0)
    8000857c:	01813083          	ld	ra,24(sp)
    80008580:	01013403          	ld	s0,16(sp)
    80008584:	0017879b          	addiw	a5,a5,1
    80008588:	06f52c23          	sw	a5,120(a0)
    8000858c:	00813483          	ld	s1,8(sp)
    80008590:	02010113          	addi	sp,sp,32
    80008594:	00008067          	ret
    80008598:	0014d493          	srli	s1,s1,0x1
    8000859c:	ffffe097          	auipc	ra,0xffffe
    800085a0:	6d0080e7          	jalr	1744(ra) # 80006c6c <mycpu>
    800085a4:	0014f493          	andi	s1,s1,1
    800085a8:	06952e23          	sw	s1,124(a0)
    800085ac:	fc5ff06f          	j	80008570 <push_off+0x34>

00000000800085b0 <pop_off>:
    800085b0:	ff010113          	addi	sp,sp,-16
    800085b4:	00813023          	sd	s0,0(sp)
    800085b8:	00113423          	sd	ra,8(sp)
    800085bc:	01010413          	addi	s0,sp,16
    800085c0:	ffffe097          	auipc	ra,0xffffe
    800085c4:	6ac080e7          	jalr	1708(ra) # 80006c6c <mycpu>
    800085c8:	100027f3          	csrr	a5,sstatus
    800085cc:	0027f793          	andi	a5,a5,2
    800085d0:	04079663          	bnez	a5,8000861c <pop_off+0x6c>
    800085d4:	07852783          	lw	a5,120(a0)
    800085d8:	02f05a63          	blez	a5,8000860c <pop_off+0x5c>
    800085dc:	fff7871b          	addiw	a4,a5,-1
    800085e0:	06e52c23          	sw	a4,120(a0)
    800085e4:	00071c63          	bnez	a4,800085fc <pop_off+0x4c>
    800085e8:	07c52783          	lw	a5,124(a0)
    800085ec:	00078863          	beqz	a5,800085fc <pop_off+0x4c>
    800085f0:	100027f3          	csrr	a5,sstatus
    800085f4:	0027e793          	ori	a5,a5,2
    800085f8:	10079073          	csrw	sstatus,a5
    800085fc:	00813083          	ld	ra,8(sp)
    80008600:	00013403          	ld	s0,0(sp)
    80008604:	01010113          	addi	sp,sp,16
    80008608:	00008067          	ret
    8000860c:	00001517          	auipc	a0,0x1
    80008610:	15450513          	addi	a0,a0,340 # 80009760 <digits+0x48>
    80008614:	fffff097          	auipc	ra,0xfffff
    80008618:	018080e7          	jalr	24(ra) # 8000762c <panic>
    8000861c:	00001517          	auipc	a0,0x1
    80008620:	12c50513          	addi	a0,a0,300 # 80009748 <digits+0x30>
    80008624:	fffff097          	auipc	ra,0xfffff
    80008628:	008080e7          	jalr	8(ra) # 8000762c <panic>

000000008000862c <push_on>:
    8000862c:	fe010113          	addi	sp,sp,-32
    80008630:	00813823          	sd	s0,16(sp)
    80008634:	00113c23          	sd	ra,24(sp)
    80008638:	00913423          	sd	s1,8(sp)
    8000863c:	02010413          	addi	s0,sp,32
    80008640:	100024f3          	csrr	s1,sstatus
    80008644:	100027f3          	csrr	a5,sstatus
    80008648:	0027e793          	ori	a5,a5,2
    8000864c:	10079073          	csrw	sstatus,a5
    80008650:	ffffe097          	auipc	ra,0xffffe
    80008654:	61c080e7          	jalr	1564(ra) # 80006c6c <mycpu>
    80008658:	07852783          	lw	a5,120(a0)
    8000865c:	02078663          	beqz	a5,80008688 <push_on+0x5c>
    80008660:	ffffe097          	auipc	ra,0xffffe
    80008664:	60c080e7          	jalr	1548(ra) # 80006c6c <mycpu>
    80008668:	07852783          	lw	a5,120(a0)
    8000866c:	01813083          	ld	ra,24(sp)
    80008670:	01013403          	ld	s0,16(sp)
    80008674:	0017879b          	addiw	a5,a5,1
    80008678:	06f52c23          	sw	a5,120(a0)
    8000867c:	00813483          	ld	s1,8(sp)
    80008680:	02010113          	addi	sp,sp,32
    80008684:	00008067          	ret
    80008688:	0014d493          	srli	s1,s1,0x1
    8000868c:	ffffe097          	auipc	ra,0xffffe
    80008690:	5e0080e7          	jalr	1504(ra) # 80006c6c <mycpu>
    80008694:	0014f493          	andi	s1,s1,1
    80008698:	06952e23          	sw	s1,124(a0)
    8000869c:	fc5ff06f          	j	80008660 <push_on+0x34>

00000000800086a0 <pop_on>:
    800086a0:	ff010113          	addi	sp,sp,-16
    800086a4:	00813023          	sd	s0,0(sp)
    800086a8:	00113423          	sd	ra,8(sp)
    800086ac:	01010413          	addi	s0,sp,16
    800086b0:	ffffe097          	auipc	ra,0xffffe
    800086b4:	5bc080e7          	jalr	1468(ra) # 80006c6c <mycpu>
    800086b8:	100027f3          	csrr	a5,sstatus
    800086bc:	0027f793          	andi	a5,a5,2
    800086c0:	04078463          	beqz	a5,80008708 <pop_on+0x68>
    800086c4:	07852783          	lw	a5,120(a0)
    800086c8:	02f05863          	blez	a5,800086f8 <pop_on+0x58>
    800086cc:	fff7879b          	addiw	a5,a5,-1
    800086d0:	06f52c23          	sw	a5,120(a0)
    800086d4:	07853783          	ld	a5,120(a0)
    800086d8:	00079863          	bnez	a5,800086e8 <pop_on+0x48>
    800086dc:	100027f3          	csrr	a5,sstatus
    800086e0:	ffd7f793          	andi	a5,a5,-3
    800086e4:	10079073          	csrw	sstatus,a5
    800086e8:	00813083          	ld	ra,8(sp)
    800086ec:	00013403          	ld	s0,0(sp)
    800086f0:	01010113          	addi	sp,sp,16
    800086f4:	00008067          	ret
    800086f8:	00001517          	auipc	a0,0x1
    800086fc:	09050513          	addi	a0,a0,144 # 80009788 <digits+0x70>
    80008700:	fffff097          	auipc	ra,0xfffff
    80008704:	f2c080e7          	jalr	-212(ra) # 8000762c <panic>
    80008708:	00001517          	auipc	a0,0x1
    8000870c:	06050513          	addi	a0,a0,96 # 80009768 <digits+0x50>
    80008710:	fffff097          	auipc	ra,0xfffff
    80008714:	f1c080e7          	jalr	-228(ra) # 8000762c <panic>

0000000080008718 <__memset>:
    80008718:	ff010113          	addi	sp,sp,-16
    8000871c:	00813423          	sd	s0,8(sp)
    80008720:	01010413          	addi	s0,sp,16
    80008724:	1a060e63          	beqz	a2,800088e0 <__memset+0x1c8>
    80008728:	40a007b3          	neg	a5,a0
    8000872c:	0077f793          	andi	a5,a5,7
    80008730:	00778693          	addi	a3,a5,7
    80008734:	00b00813          	li	a6,11
    80008738:	0ff5f593          	andi	a1,a1,255
    8000873c:	fff6071b          	addiw	a4,a2,-1
    80008740:	1b06e663          	bltu	a3,a6,800088ec <__memset+0x1d4>
    80008744:	1cd76463          	bltu	a4,a3,8000890c <__memset+0x1f4>
    80008748:	1a078e63          	beqz	a5,80008904 <__memset+0x1ec>
    8000874c:	00b50023          	sb	a1,0(a0)
    80008750:	00100713          	li	a4,1
    80008754:	1ae78463          	beq	a5,a4,800088fc <__memset+0x1e4>
    80008758:	00b500a3          	sb	a1,1(a0)
    8000875c:	00200713          	li	a4,2
    80008760:	1ae78a63          	beq	a5,a4,80008914 <__memset+0x1fc>
    80008764:	00b50123          	sb	a1,2(a0)
    80008768:	00300713          	li	a4,3
    8000876c:	18e78463          	beq	a5,a4,800088f4 <__memset+0x1dc>
    80008770:	00b501a3          	sb	a1,3(a0)
    80008774:	00400713          	li	a4,4
    80008778:	1ae78263          	beq	a5,a4,8000891c <__memset+0x204>
    8000877c:	00b50223          	sb	a1,4(a0)
    80008780:	00500713          	li	a4,5
    80008784:	1ae78063          	beq	a5,a4,80008924 <__memset+0x20c>
    80008788:	00b502a3          	sb	a1,5(a0)
    8000878c:	00700713          	li	a4,7
    80008790:	18e79e63          	bne	a5,a4,8000892c <__memset+0x214>
    80008794:	00b50323          	sb	a1,6(a0)
    80008798:	00700e93          	li	t4,7
    8000879c:	00859713          	slli	a4,a1,0x8
    800087a0:	00e5e733          	or	a4,a1,a4
    800087a4:	01059e13          	slli	t3,a1,0x10
    800087a8:	01c76e33          	or	t3,a4,t3
    800087ac:	01859313          	slli	t1,a1,0x18
    800087b0:	006e6333          	or	t1,t3,t1
    800087b4:	02059893          	slli	a7,a1,0x20
    800087b8:	40f60e3b          	subw	t3,a2,a5
    800087bc:	011368b3          	or	a7,t1,a7
    800087c0:	02859813          	slli	a6,a1,0x28
    800087c4:	0108e833          	or	a6,a7,a6
    800087c8:	03059693          	slli	a3,a1,0x30
    800087cc:	003e589b          	srliw	a7,t3,0x3
    800087d0:	00d866b3          	or	a3,a6,a3
    800087d4:	03859713          	slli	a4,a1,0x38
    800087d8:	00389813          	slli	a6,a7,0x3
    800087dc:	00f507b3          	add	a5,a0,a5
    800087e0:	00e6e733          	or	a4,a3,a4
    800087e4:	000e089b          	sext.w	a7,t3
    800087e8:	00f806b3          	add	a3,a6,a5
    800087ec:	00e7b023          	sd	a4,0(a5)
    800087f0:	00878793          	addi	a5,a5,8
    800087f4:	fed79ce3          	bne	a5,a3,800087ec <__memset+0xd4>
    800087f8:	ff8e7793          	andi	a5,t3,-8
    800087fc:	0007871b          	sext.w	a4,a5
    80008800:	01d787bb          	addw	a5,a5,t4
    80008804:	0ce88e63          	beq	a7,a4,800088e0 <__memset+0x1c8>
    80008808:	00f50733          	add	a4,a0,a5
    8000880c:	00b70023          	sb	a1,0(a4)
    80008810:	0017871b          	addiw	a4,a5,1
    80008814:	0cc77663          	bgeu	a4,a2,800088e0 <__memset+0x1c8>
    80008818:	00e50733          	add	a4,a0,a4
    8000881c:	00b70023          	sb	a1,0(a4)
    80008820:	0027871b          	addiw	a4,a5,2
    80008824:	0ac77e63          	bgeu	a4,a2,800088e0 <__memset+0x1c8>
    80008828:	00e50733          	add	a4,a0,a4
    8000882c:	00b70023          	sb	a1,0(a4)
    80008830:	0037871b          	addiw	a4,a5,3
    80008834:	0ac77663          	bgeu	a4,a2,800088e0 <__memset+0x1c8>
    80008838:	00e50733          	add	a4,a0,a4
    8000883c:	00b70023          	sb	a1,0(a4)
    80008840:	0047871b          	addiw	a4,a5,4
    80008844:	08c77e63          	bgeu	a4,a2,800088e0 <__memset+0x1c8>
    80008848:	00e50733          	add	a4,a0,a4
    8000884c:	00b70023          	sb	a1,0(a4)
    80008850:	0057871b          	addiw	a4,a5,5
    80008854:	08c77663          	bgeu	a4,a2,800088e0 <__memset+0x1c8>
    80008858:	00e50733          	add	a4,a0,a4
    8000885c:	00b70023          	sb	a1,0(a4)
    80008860:	0067871b          	addiw	a4,a5,6
    80008864:	06c77e63          	bgeu	a4,a2,800088e0 <__memset+0x1c8>
    80008868:	00e50733          	add	a4,a0,a4
    8000886c:	00b70023          	sb	a1,0(a4)
    80008870:	0077871b          	addiw	a4,a5,7
    80008874:	06c77663          	bgeu	a4,a2,800088e0 <__memset+0x1c8>
    80008878:	00e50733          	add	a4,a0,a4
    8000887c:	00b70023          	sb	a1,0(a4)
    80008880:	0087871b          	addiw	a4,a5,8
    80008884:	04c77e63          	bgeu	a4,a2,800088e0 <__memset+0x1c8>
    80008888:	00e50733          	add	a4,a0,a4
    8000888c:	00b70023          	sb	a1,0(a4)
    80008890:	0097871b          	addiw	a4,a5,9
    80008894:	04c77663          	bgeu	a4,a2,800088e0 <__memset+0x1c8>
    80008898:	00e50733          	add	a4,a0,a4
    8000889c:	00b70023          	sb	a1,0(a4)
    800088a0:	00a7871b          	addiw	a4,a5,10
    800088a4:	02c77e63          	bgeu	a4,a2,800088e0 <__memset+0x1c8>
    800088a8:	00e50733          	add	a4,a0,a4
    800088ac:	00b70023          	sb	a1,0(a4)
    800088b0:	00b7871b          	addiw	a4,a5,11
    800088b4:	02c77663          	bgeu	a4,a2,800088e0 <__memset+0x1c8>
    800088b8:	00e50733          	add	a4,a0,a4
    800088bc:	00b70023          	sb	a1,0(a4)
    800088c0:	00c7871b          	addiw	a4,a5,12
    800088c4:	00c77e63          	bgeu	a4,a2,800088e0 <__memset+0x1c8>
    800088c8:	00e50733          	add	a4,a0,a4
    800088cc:	00b70023          	sb	a1,0(a4)
    800088d0:	00d7879b          	addiw	a5,a5,13
    800088d4:	00c7f663          	bgeu	a5,a2,800088e0 <__memset+0x1c8>
    800088d8:	00f507b3          	add	a5,a0,a5
    800088dc:	00b78023          	sb	a1,0(a5)
    800088e0:	00813403          	ld	s0,8(sp)
    800088e4:	01010113          	addi	sp,sp,16
    800088e8:	00008067          	ret
    800088ec:	00b00693          	li	a3,11
    800088f0:	e55ff06f          	j	80008744 <__memset+0x2c>
    800088f4:	00300e93          	li	t4,3
    800088f8:	ea5ff06f          	j	8000879c <__memset+0x84>
    800088fc:	00100e93          	li	t4,1
    80008900:	e9dff06f          	j	8000879c <__memset+0x84>
    80008904:	00000e93          	li	t4,0
    80008908:	e95ff06f          	j	8000879c <__memset+0x84>
    8000890c:	00000793          	li	a5,0
    80008910:	ef9ff06f          	j	80008808 <__memset+0xf0>
    80008914:	00200e93          	li	t4,2
    80008918:	e85ff06f          	j	8000879c <__memset+0x84>
    8000891c:	00400e93          	li	t4,4
    80008920:	e7dff06f          	j	8000879c <__memset+0x84>
    80008924:	00500e93          	li	t4,5
    80008928:	e75ff06f          	j	8000879c <__memset+0x84>
    8000892c:	00600e93          	li	t4,6
    80008930:	e6dff06f          	j	8000879c <__memset+0x84>

0000000080008934 <__memmove>:
    80008934:	ff010113          	addi	sp,sp,-16
    80008938:	00813423          	sd	s0,8(sp)
    8000893c:	01010413          	addi	s0,sp,16
    80008940:	0e060863          	beqz	a2,80008a30 <__memmove+0xfc>
    80008944:	fff6069b          	addiw	a3,a2,-1
    80008948:	0006881b          	sext.w	a6,a3
    8000894c:	0ea5e863          	bltu	a1,a0,80008a3c <__memmove+0x108>
    80008950:	00758713          	addi	a4,a1,7
    80008954:	00a5e7b3          	or	a5,a1,a0
    80008958:	40a70733          	sub	a4,a4,a0
    8000895c:	0077f793          	andi	a5,a5,7
    80008960:	00f73713          	sltiu	a4,a4,15
    80008964:	00174713          	xori	a4,a4,1
    80008968:	0017b793          	seqz	a5,a5
    8000896c:	00e7f7b3          	and	a5,a5,a4
    80008970:	10078863          	beqz	a5,80008a80 <__memmove+0x14c>
    80008974:	00900793          	li	a5,9
    80008978:	1107f463          	bgeu	a5,a6,80008a80 <__memmove+0x14c>
    8000897c:	0036581b          	srliw	a6,a2,0x3
    80008980:	fff8081b          	addiw	a6,a6,-1
    80008984:	02081813          	slli	a6,a6,0x20
    80008988:	01d85893          	srli	a7,a6,0x1d
    8000898c:	00858813          	addi	a6,a1,8
    80008990:	00058793          	mv	a5,a1
    80008994:	00050713          	mv	a4,a0
    80008998:	01088833          	add	a6,a7,a6
    8000899c:	0007b883          	ld	a7,0(a5)
    800089a0:	00878793          	addi	a5,a5,8
    800089a4:	00870713          	addi	a4,a4,8
    800089a8:	ff173c23          	sd	a7,-8(a4)
    800089ac:	ff0798e3          	bne	a5,a6,8000899c <__memmove+0x68>
    800089b0:	ff867713          	andi	a4,a2,-8
    800089b4:	02071793          	slli	a5,a4,0x20
    800089b8:	0207d793          	srli	a5,a5,0x20
    800089bc:	00f585b3          	add	a1,a1,a5
    800089c0:	40e686bb          	subw	a3,a3,a4
    800089c4:	00f507b3          	add	a5,a0,a5
    800089c8:	06e60463          	beq	a2,a4,80008a30 <__memmove+0xfc>
    800089cc:	0005c703          	lbu	a4,0(a1)
    800089d0:	00e78023          	sb	a4,0(a5)
    800089d4:	04068e63          	beqz	a3,80008a30 <__memmove+0xfc>
    800089d8:	0015c603          	lbu	a2,1(a1)
    800089dc:	00100713          	li	a4,1
    800089e0:	00c780a3          	sb	a2,1(a5)
    800089e4:	04e68663          	beq	a3,a4,80008a30 <__memmove+0xfc>
    800089e8:	0025c603          	lbu	a2,2(a1)
    800089ec:	00200713          	li	a4,2
    800089f0:	00c78123          	sb	a2,2(a5)
    800089f4:	02e68e63          	beq	a3,a4,80008a30 <__memmove+0xfc>
    800089f8:	0035c603          	lbu	a2,3(a1)
    800089fc:	00300713          	li	a4,3
    80008a00:	00c781a3          	sb	a2,3(a5)
    80008a04:	02e68663          	beq	a3,a4,80008a30 <__memmove+0xfc>
    80008a08:	0045c603          	lbu	a2,4(a1)
    80008a0c:	00400713          	li	a4,4
    80008a10:	00c78223          	sb	a2,4(a5)
    80008a14:	00e68e63          	beq	a3,a4,80008a30 <__memmove+0xfc>
    80008a18:	0055c603          	lbu	a2,5(a1)
    80008a1c:	00500713          	li	a4,5
    80008a20:	00c782a3          	sb	a2,5(a5)
    80008a24:	00e68663          	beq	a3,a4,80008a30 <__memmove+0xfc>
    80008a28:	0065c703          	lbu	a4,6(a1)
    80008a2c:	00e78323          	sb	a4,6(a5)
    80008a30:	00813403          	ld	s0,8(sp)
    80008a34:	01010113          	addi	sp,sp,16
    80008a38:	00008067          	ret
    80008a3c:	02061713          	slli	a4,a2,0x20
    80008a40:	02075713          	srli	a4,a4,0x20
    80008a44:	00e587b3          	add	a5,a1,a4
    80008a48:	f0f574e3          	bgeu	a0,a5,80008950 <__memmove+0x1c>
    80008a4c:	02069613          	slli	a2,a3,0x20
    80008a50:	02065613          	srli	a2,a2,0x20
    80008a54:	fff64613          	not	a2,a2
    80008a58:	00e50733          	add	a4,a0,a4
    80008a5c:	00c78633          	add	a2,a5,a2
    80008a60:	fff7c683          	lbu	a3,-1(a5)
    80008a64:	fff78793          	addi	a5,a5,-1
    80008a68:	fff70713          	addi	a4,a4,-1
    80008a6c:	00d70023          	sb	a3,0(a4)
    80008a70:	fec798e3          	bne	a5,a2,80008a60 <__memmove+0x12c>
    80008a74:	00813403          	ld	s0,8(sp)
    80008a78:	01010113          	addi	sp,sp,16
    80008a7c:	00008067          	ret
    80008a80:	02069713          	slli	a4,a3,0x20
    80008a84:	02075713          	srli	a4,a4,0x20
    80008a88:	00170713          	addi	a4,a4,1
    80008a8c:	00e50733          	add	a4,a0,a4
    80008a90:	00050793          	mv	a5,a0
    80008a94:	0005c683          	lbu	a3,0(a1)
    80008a98:	00178793          	addi	a5,a5,1
    80008a9c:	00158593          	addi	a1,a1,1
    80008aa0:	fed78fa3          	sb	a3,-1(a5)
    80008aa4:	fee798e3          	bne	a5,a4,80008a94 <__memmove+0x160>
    80008aa8:	f89ff06f          	j	80008a30 <__memmove+0xfc>
	...
